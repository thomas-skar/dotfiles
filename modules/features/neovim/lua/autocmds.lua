-- save changes when leaving insert mode
vim.api.nvim_create_autocmd('InsertLeave', {
  pattern = '*',
  callback = function()
    if vim.bo.modified and vim.bo.buftype == '' then vim.cmd 'silent! update' end
  end,
})

-- show lsp hover on cursor hold
vim.api.nvim_create_autocmd('CursorHold', {
  callback = function()
    if next(vim.lsp.get_clients { bufnr = 0 }) ~= nil then vim.lsp.buf.hover { focusable = false, silent = true } end
  end,
})
