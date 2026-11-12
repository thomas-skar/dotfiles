Config.later(function()
  if Config.surround ~= 'visual' then return end

  Config.add { { src = 'https://github.com/NStefan002/visual-surround.nvim' } }

  require('visual-surround').setup { use_default_keymaps = true }
end)
