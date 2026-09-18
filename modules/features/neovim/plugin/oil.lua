vim.pack.add {
  -- 'https://github.com/stevearc/oil.nvim'
  'https://github.com/barrettruth/canola.nvim',
}

require('oil').setup {
  default_file_explorer = vim.g.file_explorer == 'oil',
  delete_to_trash = true,
  watch_for_changes = true,
  view_options = { show_hidden = true },
  lsp_file_methods = { enabled = true },
  constrain_cursor = 'editable',
  float = {
    border = 'rounded',
    preview_split = 'auto',
  },
  columns = {
    'icon',
  },
  confirmation = {
    border = 'rounded',
  },
  preview_win = {
    update_on_cursor_moved = true,
  },
  keymaps_help = {
    border = 'rounded',
  },
  use_default_keymaps = false,
  keymaps = {
    ['h'] = { 'actions.show_help', mode = 'n' },
    ['p'] = { 'actions.preview', mode = 'n' },
    ['<CR>'] = 'actions.select',
    ['<leader>cd'] = { 'actions.cd', mode = 'n' },
  },
}

------------------------------------------------------------------------------------

-- open oil with <Shift-Ctrl-O>
vim.keymap.set('n', '<S-C-o>', '<CMD>Oil<CR>')
