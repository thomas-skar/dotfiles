local later, add = Config.later, Config.add
local surround = Config.surround

later(function()
  if surround ~= 'visual' then return end

  add { { src = 'https://github.com/NStefan002/visual-surround.nvim' } }

  require('visual-surround').setup { use_default_keymaps = true }
end)
