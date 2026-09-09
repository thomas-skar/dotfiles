vim.pack.add { 'https://github.com/khoido2003/monokai-v2.nvim' }

require('monokai-v2').setup {
  devicons = true,
  terminal_colors = true,
  filter = 'pro',
  treesitter = { italic = false },
  background_clear = { 'telescope', 'nvim-tree', 'float_win' },
}

vim.cmd.colorscheme 'monokai-v2'

-- vim.pack.add { 'https://github.com/loctvl842/monokai-pro.nvim' }
-- require('monokai-pro').setup {}
-- vim.cmd.colorscheme 'monokai-pro'
