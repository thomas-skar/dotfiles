-- TODO: mini.basics (source code)

vim.pack.add {
  { src = 'https://github.com/nvim-mini/mini.nvim' },
}

if vim.g.have_nerd_font then
  require('mini.icons').setup { style = 'glyph' }
  vim.cmd ':lua MiniIcons.mock_nvim_web_devicons()'
end

require('mini.statusline').setup {
  use_icons = vim.g.have_nerd_font,
}

require('mini.extra').setup()

require('mini.pairs').setup {}

require('mini.cursorword').setup {}

require('mini.comment').setup {
  options = {
    ignore_blank_line = false,
    pad_comment_pars = true,
  },
}

require('mini.trailspace').setup {}

require('mini.statuscolumn').setup {}

require('mini.move').setup {
  mappings = {
    -- visual mode
    left = '<S-Tab>',
    right = '<Tab>',
    up = '<A-Up>',
    down = '<A-Down>',
    -- normal mode
    line_left = '<S-Tab>',
    line_right = '<Tab>',
    line_up = '<A-Up>',
    line_down = '<A-Down>',
  },
}

require('mini.clue').setup {
  clues = {},
  triggers = {
    { mode = { 'n', 'x' }, keys = '<Leader>' },
    { mode = { 'n', 'x' }, keys = 'g' },
    { mode = 'n', keys = '<C-k>' },
  },
  window = {
    config = {},
    delay = 500,
    scroll_up = '<C-u>',
    scroll_down = '<C-d>',
  },
}

require('mini.map').setup {
  window = {
    focusable = false,
    side = 'right',
  },
}

require('mini.notify').setup { lsp_progress = { enable = true } }

require('mini.indentscope').setup {
  draw = {
    animation = require('mini.indentscope').gen_animation.none(),
  },
  options = {
    indent_at_cursor = true,
    try_as_border = true,
  },
}

require('mini.bufremove').setup { silent = false }

vim.keymap.set('n', '<C-w>', '<CMD>lua MiniBufremove.delete()<CR>', { desc = 'Close buffer' })
vim.keymap.set('n', '<C-k><C-w>', '<CMD>lua MiniBufremove.delete()<CR>', { desc = 'Close all buffers' }) -- TODO: close all buffers

require('mini.starter').setup {
  autoopen = true,
  evaluate_single = true,
  items = {
    require('mini.starter').sections.recent_files(10, true),
    { name = 'N: New file', action = 'enew', section = 'Shortcuts' },
    { name = 'P: Find files', action = 'lua require("fff").find_files()', section = 'Shortcuts' },
    { name = 'F: Live grep', action = 'lua require("fff").live_grep()', section = 'Shortcuts' },
    { name = 'E: Open file explorer', action = 'NvimTreeOpen', section = 'Shortcuts' },
    { name = 'O: Open oil', action = 'Oil', section = 'Shortcuts' },
    { name = 'Q: Quit', action = 'qa', section = 'Shortcuts' },
  },
  header = nil,
  footer = nil,
}

if Config.tabline == 'mini' then
  -- TODO:
  require('mini.tabline').setup {}
end

if Config.surround == 'mini' then
  -- TODO: keybinds
  require('mini.surround').setup {}
end
