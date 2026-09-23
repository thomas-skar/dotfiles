-- TODO: show diagnostics AND lsp at the same time @ hover ???

-- show diagnostics/lsp @ hover
vim.api.nvim_create_autocmd('CursorHold', {
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
  callback = function() vim.highlight.on_yank() end,
})

-- stop the autocomplete popup menu from appearing inside "telescope"
vim.api.nvim_create_autocmd('BufEnter', {
  callback = function(ev)
    if vim.bo[ev.buf].buftype ~= '' then vim.bo[ev.buf].autocomplete = false end
  end,
})
