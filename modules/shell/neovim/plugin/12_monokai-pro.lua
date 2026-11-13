local now, add = Config.now, Config.add

now(function()
  add { { src = 'https://github.com/khoido2003/monokai-v2.nvim' } }

  require('monokai-v2').setup {
    transparent_background = false,
    terminal_colors = true,
    devicons = true,
    treesitter = { italic = true },
    filter = 'pro',
    day_night = { enable = false },
    inc_search = 'background',
  }

  vim.cmd.colorscheme 'monokai-v2'
end)
