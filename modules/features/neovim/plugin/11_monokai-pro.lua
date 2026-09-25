vim.pack.add {
  { src = 'https://github.com/khoido2003/monokai-v2.nvim', name = 'monokai-pro' },
}

require('monokai-v2').setup {
  transparent_background = false,
  terminal_colors = true,
  devicons = true,
  treesitter = { italic = true },
  filter = 'pro',
  day_night = { enable = false },
  inc_search = 'background',
  plugins = {
    bufferline = {
      underline_selected = true,
    },
  },
}

vim.cmd.colorscheme 'monokai-v2'

-- vim.pack.add { 'https://github.com/loctvl842/monokai-pro.nvim' }
-- require('monokai-pro').setup {}
-- vim.cmd.colorscheme 'monokai-pro'
