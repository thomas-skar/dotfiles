vim.pack.add {
  { src = 'https://forge.barrettruth.com/barrettruth/canola.nvim' },
}

-- TODO: accept changes with <CR>

---@type oil.setupOpts
local opts = {
  default_file_explorer = true,
  default_to_float = true,
  columns = {
    'icon',
  },
  delete_to_trash = true,
  cleanup_buffers_on_delete = true,
  skip_confirm_for_simple_edits = false,
  skip_confirm_for_delete = false,
  constrain_cursor = 'editable',
  watch_for_changes = true,
  keymaps = {
    ['h'] = { 'actions.show_help', mode = 'n' },
    ['<S-p>'] = { 'actions.preview', mode = 'n' },
    ['<CR>'] = 'actions.select',
  },
  use_default_keymaps = false,
  view_options = {
    show_hidden = true,
  },
  float = {
    title = false,
    padding = 2,
    max_width = 0.66,
    max_height = 0.8,
    border = 'rounded',
    preview_split = 'auto',
  },
  preview_win = {
    update_on_cursor_moved = true,
    preview_method = 'fast_scratch',
  },
}

require('oil').setup(opts)

local function toggle_oil()
  if vim.bo.filetype == 'oil' then
    require('oil').close()
  else
    require('oil').open()
  end
end

-- toggle oil with <Shift-Ctrl-O>
vim.keymap.set('n', '<S-C-o>', toggle_oil, { desc = 'Toggle Oil' })
vim.keymap.set('n', '<leader>fe', toggle_oil, { desc = 'Toggle Oil' })
