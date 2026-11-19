if Config.surround ~= 'visual' then return end

local later, add = Config.later, Config.plugins.add

later(function()
  add { 'https://github.com/NStefan002/visual-surround.nvim' }

  require('visual-surround').setup { use_default_keymaps = true }
end)
