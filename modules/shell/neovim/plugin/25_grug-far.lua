local later, add, map = Config.later, Config.add, Config.map

later(function()
  add { 'https://github.com/magicduck/grug-far.nvim' }

  local gf = require 'grug-far'
  gf.setup {
    engine = 'ripgrep',
    windowCreationCommand = 'botright split',
    helpLine = {
      enabled = true,
    },
    startInInsertMode = false,
    showCompactInputs = true,
    showInputsTopPadding = false,
    showInputsBottomPadding = false,
    transient = true,
    keymaps = {
      help = { n = '<localleader>h' },
    },
    icons = {
      enabled = true,
    },
  }

  map('n', '<leader>gf', function() gf.open() end, 'Search and replace')
end)
