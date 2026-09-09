vim.pack.add { 'https://github.com/nvim-tree/nvim-tree.lua' }

require('nvim-tree').setup {
  hijack_cursor = true,
  hijack_netrw = true,
  respect_buf_cwd = true,
  sync_root_with_cwd = true,
  auto_reload_on_write = true,
  view = {
    side = 'left',
    number = false,
    cursorline = true,
  },
  update_focused_file = {
    enable = true,
    update_root = true,
  },
}
