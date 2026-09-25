---@type "lsp"|"diag"|nil
Config.floating_window_type = nil

---@param bufnr number|nil
---@return number|nil
Config.get_hover_preview_winid = function(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()
  local hover_win = vim.b[bufnr].hover_preview
  if hover_win and vim.api.nvim_win_is_valid(hover_win) then return hover_win end
  return nil
end

-- show popup window (lsp, diagnostics) @ hover
vim.api.nvim_create_autocmd('CursorHold', {
  pattern = '*',
  callback = function()
    local bufnr = vim.api.nvim_get_current_buf()
    if Config.get_hover_preview_winid(bufnr) then return end

    if Config.floating_window_type ~= 'diag' then
      local errors = vim.diagnostic.get(bufnr, { scope = 'cursor' })
      if #errors > 0 then
        vim.diagnostic.open_float { focusable = false, scope = 'cursor' }
        Config.floating_window_type = 'diag'
        return
      end
    end

    if Config.floating_window_type ~= 'lsp' then
      local lsp_clients = vim.lsp.get_clients { bufnr = bufnr, method = 'textDocument/hover' }
      if #lsp_clients == 0 then return end
      vim.lsp.buf.hover { focusable = false, silent = true }
      Config.floating_window_type = 'lsp'
    end
  end,
})

-- clear "CursorHold" eventignore @ CursorMoved
vim.api.nvim_create_autocmd('CursorMoved', {
  pattern = '*',
  callback = function()
    if type(vim.o.eventignore) == 'string' then
      if vim.o.eventignore == '' then return end
      if string.find(vim.o.eventignore, 'CursorHold') ~= nil then
        vim.o.eventignore = vim.o.eventignore:gsub('CursorHold,', ''):gsub('CursorHold', '')
        return
      end
    elseif type(vim.o.eventignore) == 'table' then
      ---@diagnostic disable-next-line: param-type-mismatch
      for i, v in ipairs(vim.o.eventignore) do
        if v == 'CursorHold' then vim.o.eventignore:remove(i) end
      end
    end
    Config.floating_window_type = nil
  end,
})

-- show/ switch between lsp and diagnostics floating windows with <Shift-K>
vim.keymap.set('n', 'K', function()
  local bufnr = vim.api.nvim_get_current_buf()
  local winid = Config.get_hover_preview_winid(bufnr)

  if Config.floating_window_type ~= 'diag' then
    local errors = vim.diagnostic.get(bufnr, { scope = 'cursor' })
    if #errors > 0 then
      if winid then vim.api.nvim_win_close(winid, true) end
      vim.diagnostic.open_float { focusable = false, scope = 'cursor' }
      Config.floating_window_type = 'diag'
      return
    end
  end

  if Config.floating_window_type ~= 'lsp' then
    local lsp_clients = vim.lsp.get_clients { bufnr = bufnr, method = 'textDocument/hover' }
    if #lsp_clients == 0 then return end
    if winid then vim.api.nvim_win_close(winid, true) end
    vim.lsp.buf.hover { focusable = false, silent = true }
    Config.floating_window_type = 'lsp'
  end
end)

-- close floating windows, clear search highlights, etc with <Esc>
vim.keymap.set('n', '<Esc>', function()
  local done = false

  -- close popup windows
  local wins = vim.api.nvim_list_wins()
  for _, win in ipairs(wins) do
    -- don't close snacks windows (explorer)
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.bo[buf].filetype:find 'snacks' then goto continue end

    -- close floating windows
    local cfg = vim.api.nvim_win_get_config(win)
    if cfg.relative ~= '' then
      vim.api.nvim_win_close(win, true)
      done = true
    end
    ::continue::
  end

  if done then
    -- NOTE: include CursorHold in eventignore to prevent popup window from reopening immediately
    if type(vim.o.eventignore) == 'string' then
      if vim.o.eventignore == '' then
        vim.o.eventignore = 'CursorHold'
      else
        vim.o.eventignore = vim.o.eventignore .. ',CursorHold'
      end
    elseif type(vim.o.eventignore) == 'table' then
      vim.o.eventignore:append 'CursorHold'
    end

    Config.floating_window_type = nil

    return
  end

  -- clear search highlights
  vim.cmd 'nohlsearch'
end)
