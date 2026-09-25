vim.pack.add {
  { src = 'https://github.com/lewis6991/gitsigns.nvim', name = 'gitsigns' },
}

require('gitsigns').setup {
  auto_attach = true,
  attach_to_untracked = false,
  current_line_blame = false,
  signcolumn = true,
}
