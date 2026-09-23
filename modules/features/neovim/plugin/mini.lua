-- TODO: https://github.com/nvim-mini/mini.nvim/blob/main/readmes/mini-keymap.md

vim.pack.add { 'https://github.com/nvim-mini/mini.nvim' }

-- icons
if vim.g.have_nerd_font then
  require('mini.icons').setup { style = 'glyph' }
  vim.cmd ':lua MiniIcons.mock_nvim_web_devicons()'
end

-- cursorword
require('mini.cursorword').setup {}

-- pairs
require('mini.pairs').setup {}

-- comment
require('mini.comment').setup {}

-- trailspace
require('mini.trailspace').setup {}

-- statusline
if vim.g.statusline == 'mini' then require('mini.statusline').setup {
  use_icons = vim.g.have_nerd_font,
} end

-- move
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

-- surround
if vim.g.surround == 'mini' then
  require('mini.surround').setup {
    mappings = {
      add = 'sa',
      delete = '', -- sd
      find = '', -- sf
      find_left = '', -- sF
      highlight = '', -- sh
      replace = '', -- sr
      suffix_last = '', -- l
      suffix_next = '', -- n
    },
  }

  -- WARN: keybinds doesn't work :(
  vim.keymap.set('x', '"', 'sa"')
  vim.keymap.set('x', '<', 'sa<')
  vim.keymap.set('x', "'", "sa'")
  vim.keymap.set('x', '[[', 'sa[')
  vim.keymap.set('x', '{', 'sa{')
  vim.keymap.set('x', '(', 'sa(')
  vim.keymap.set('x', '`', 'sa`')
end
