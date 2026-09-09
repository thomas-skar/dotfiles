-- TODO: exit insert mode when window loses focus ???

-- show lsp hover on cursor hold
vim.api.nvim_create_autocmd('CursorHold', {
  callback = function()
    if next(vim.lsp.get_clients { bufnr = 0 }) ~= nil then vim.lsp.buf.hover { focusable = false, silent = true } end
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
