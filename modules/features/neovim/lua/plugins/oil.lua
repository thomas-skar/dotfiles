vim.pack.add { 'https://github.com/stevearc/oil.nvim' }

require('oil').setup {
  default_file_explorer = false,
  delete_to_trash = true,
  view_options = {
    show_hidden = true,
  },
  float = {
    border = 'rounded',
  },
}
