-- show diagnostics/lsp @ hover
vim.api.nvim_create_autocmd('CursorHold', {
  callback = function()
    local diags = vim.diagnostic.get(0, { scope = 'cursor' })
    if #diags > 0 then
      pcall(vim.diagnostic.open_float, { focusable = false, silent = true })
      return
    end

    -- vim.diagnostic.open_float(nil, {
    --   focusable = false,
    --   silent = true,
    --   close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter', 'FocusLost' },
    --   border = 'rounded',
    --   source = 'always',
    --   prefix = ' ',
    --   scope = 'cursor',
    -- })

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
