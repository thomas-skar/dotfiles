-- TODO: side-by-side preview
-- TODO_ custom pickers
-- -- LSPs
-- -- projects (cd)

require('mini.pick').setup {
  window = { config = { border = 'rounded' } },
}

vim.keymap.set('n', '<S-C-h>', '<CMD>lua MiniPick.builtin.help()<CR>', { desc = 'Show help picker' })
vim.keymap.set('n', '<C-b>', '<CMD>lua MiniPick.builtin.buffers()<CR>', { desc = 'Show buffer picker' })
vim.keymap.set('n', '<leader>er', '<CMD>lua MiniExtra.pickers.diagnostic()<CR>', { desc = 'Show diagnostics picker' })
vim.keymap.set('n', '<leader>di', '<CMD>lua MiniExtra.pickers.diagnostic()<CR>', { desc = 'Show diagnostics picker' })
vim.keymap.set('n', '<leader>pr', '<CMD>lua MiniExtra.pickers.explorer()<CR>', { desc = 'Show file explorer picker' })
