local later, add = Config.later, Config.add

later(function()
  add { { src = 'https://github.com/hiphish/rainbow-delimiters.nvim' } }

  require('rainbow-delimiters.setup').setup {}
end)
