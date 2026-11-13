local later, add = Config.later, Config.add
local tree = Config.tree

later(function()
  if tree ~= 'neo-tree' then return end

  add {
    { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = vim.version.range '3' },
    { src = 'https://github.com/nvim-lua/plenary.nvim' },
    { src = 'https://github.com/MunifTanjim/nui.nvim' },
  }

  ---@type neotree.Config
  local config = {}

  require('neo-tree').setup(config)
end)
