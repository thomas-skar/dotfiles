vim.pack.add {
  { src = 'https://github.com/NStefan002/visual-surround.nvim', name = 'visual-surround' },
}

if Config.surround == 'visual' then require('visual-surround').setup {
  use_default_keymaps = true,
} end
