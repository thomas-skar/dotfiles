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
