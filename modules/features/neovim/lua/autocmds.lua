-- show lsp @ hover
vim.api.nvim_create_autocmd('CursorHold', {
  callback = function()
    if next(vim.lsp.get_clients { bufnr = 0 }) ~= nil then vim.lsp.buf.hover { focusable = false, silent = true } end
  end,
})

-- show diagnostics @ hover
-- vim.api.nvim_create_autocmd('CursorHold', {
--   -- buffer = bufnr,
--   callback = function()
--     vim.diagnostic.open_float(nil, {
--       focusable = false,
--       silent = true,
--       close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter', 'FocusLost' },
--       border = 'rounded',
--       source = 'always',
--       prefix = ' ',
--       scope = 'cursor',
--     })
--   end,
-- })

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

-- TODO: auto-save @ focus lost
-- vim.api.nvim_create_autocmd('FocusLost', {
--   pattern = '*',
--   callback = function() vim.cmd 'silent! wall' end,
-- })

-- TODO: show diagnostics/lsp @ hover
-- vim.api.nvim_create_autocmd('CursorHold', {
--   callback = function()
--     local bufnr = vim.api.nvim_get_current_buf()
--     local row, _ = table.unpack(vim.api.nvim_win_get_cursor(0))
--     local line_diags = vim.diagnostic.get(bufnr, { lnum = row - 1 })
--
--     -- 1. If there are diagnostics, open the diagnostic float first
--     if not vim.tbl_isempty(line_diags) then vim.diagnostic.open_float(nil, {
--       scope = 'line',
--       focus = false,
--       border = 'rounded',
--     }) end
--
--     -- 2. Simultaneously trigger the native LSP hover doc
--     vim.lsp.buf.hover { border = 'rounded', focusable = false, silent = true }
--   end,
-- })
