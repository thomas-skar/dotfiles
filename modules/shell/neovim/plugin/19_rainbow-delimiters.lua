local later, add = Config.later, Config.plugins.add

later(function()
  add { 'https://github.com/hiphish/rainbow-delimiters.nvim' }

  require('rainbow-delimiters.setup').setup {}
end)
