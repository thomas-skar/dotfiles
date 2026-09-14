vim.pack.add {
  -- 'https://github.com/stevearc/oil.nvim'
  'https://github.com/barrettruth/canola.nvim',
}

require('oil').setup {
  default_file_explorer = true,
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
    -- disable_preview = function(filename)
    --   -- TODO: disable preview for directories?
    --   return false
    -- end,
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

-- open oil with <Ctrl-O> and <Shift-Ctrl-O>
vim.keymap.set('n', '<C-o>', '<CMD>Oil<CR>')
vim.keymap.set('n', '<S-C-o>', '<CMD>Oil<CR>')

-- open oil preview automatically

-- vim.api.nvim_create_autocmd('User', {
--   pattern = 'OilEnter',
--   callback = vim.schedule_wrap(function(args)
--     local oil = require 'oil'
--     if vim.api.nvim_get_current_buf() == args.data.buf and oil.get_cursor_entry() then oil.open_preview() end
--   end),
-- })
