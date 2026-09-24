if Config.surround == 'visual' then
  vim.pack.add { 'https://github.com/NStefan002/visual-surround.nvim' }
  require('visual-surround').setup {
    use_default_keymaps = true,
  }
end
