-- TODO: show diagnostics AND lsp at the same time @ hover ???

local group = vim.api.nvim_create_augroup('custom', {})

-- show diagnostics/lsp @ hover
vim.api.nvim_create_autocmd('CursorHold', {
  group = group,
  pattern = '*',
  callback = function()
    local diags = vim.diagnostic.get(0, { scope = 'cursor' })
    if #diags > 0 then
      pcall(vim.diagnostic.open_float, { focusable = false, silent = true })
      return
    end

    local clients = vim.lsp.get_clients { bufnr = 0 }
    if #clients == 0 then return end

    for _, client in pairs(clients) do
      if client:supports_method(vim.lsp.protocol.Methods.textDocument_hover) then
        ---@diagnostic disable-next-line: redundant-parameter
        vim.lsp.buf.hover { focusable = false, silent = true }
        return
      end
    end
  end,
})

-- clear "CursorHold" eventignore @ CursorMoved
vim.api.nvim_create_autocmd('CursorMoved', {
  group = group,
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
  end,
})

-- highlight text when copying
vim.api.nvim_create_autocmd('TextYankPost', {
  group = group,
  callback = function() vim.highlight.on_yank() end,
})

-- stop the autocomplete popup menu from appearing inside "telescope"
vim.api.nvim_create_autocmd('BufEnter', {
  group = group,
  callback = function(ev)
    if vim.bo[ev.buf].buftype ~= '' then vim.bo[ev.buf].autocomplete = false end
  end,
})

-- DOCS: https://main.cmp.saghen.dev/recipes.html#hide-copilot-on-suggestion
vim.api.nvim_create_autocmd('User', {
  group = group,
  pattern = 'BlinkCmpMenuOpen',
  callback = function() vim.b.copilot_suggestion_hidden = true end,
})

vim.api.nvim_create_autocmd('User', {
  group = group,
  pattern = 'BlinkCmpMenuClose',
  callback = function() vim.b.copilot_suggestion_hidden = false end,
})
