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

-- bufremove
require('mini.bufremove').setup {}

-- comment
require('mini.comment').setup {}

-- trailspace
require('mini.trailspace').setup {}

------------------------------------------------------------------------------------

-- close buffer with <Ctrl-W>
vim.keymap.set('n', '<C-w>', '<CMD>lua MiniBufremove.delete(0, false)<CR>')
