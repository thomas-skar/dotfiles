vim.pack.add { 'https://github.com/lewis6991/satellite.nvim' }

require('satellite').setup {
  current_only = false,
  width = 2,
  handlers = {
    cursor = {
      enable = true,
    },
    search = {
      enable = true,
    },
    diagnostic = {
      enable = true,
    },
    gitsigns = {
      enable = true,
    },
    marks = {
      enable = true,
    },
  },
}
