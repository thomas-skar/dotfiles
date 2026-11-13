local later, add, map = Config.later, Config.add, Config.map
local files = Config.files

later(function()
  if files ~= 'yazi' then return end

  add {
    { src = 'https://github.com/mikavilpas/yazi.nvim' },
    { src = 'https://github.com/nvim-lua/plenary.nvim' },
  }

  ---@type YaziConfig
  local opts = {
    yazi_floating_window_border = 'rounded',
    highlight_hovered_buffers_in_same_directory = true,
  }

  local yazi = require 'yazi'
  yazi.setup(opts)

  map('n', '<C-S-o>', function() yazi.yazi() end, 'Open yazi')
  map('n', '<leader>fe', function() yazi.yazi() end, 'Open yazi')
end)
