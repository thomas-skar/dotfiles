-- show diagnostics/lsp @ hover
vim.api.nvim_create_autocmd('CursorHold', {
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
        vim.lsp.buf.hover { focusable = false, silent = true }
        return
      end
    end
  end,
})

-- highlight text when copying
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function() vim.highlight.on_yank() end,
})

-- stop the autocomplete popup menu from appearing inside telescope
vim.api.nvim_create_autocmd('BufEnter', {
  callback = function(ev)
    if vim.bo[ev.buf].buftype ~= '' then vim.bo[ev.buf].autocomplete = false end
  end,
})
