local later, add, map = Config.later, Config.add, Config.map

later(function()
  add { 'https://github.com/magicduck/grug-far.nvim' }

  local gf = require 'grug-far'
  gf.setup {}

  map('n', '<leader>gf', function() gf.open() end, 'Open grug-far')
end)
