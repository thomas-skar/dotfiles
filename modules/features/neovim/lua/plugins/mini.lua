-- TODO: https://github.com/nvim-mini/mini.nvim/blob/main/readmes/mini-keymap.md

vim.pack.add { 'https://github.com/nvim-mini/mini.nvim' }

-- icons
if vim.g.have_nerd_font then
  require('mini.icons').setup { style = 'glyph' }
  vim.cmd ':lua MiniIcons.mock_nvim_web_devicons()'
end

-- statusline
require('mini.statusline').setup { use_icons = vim.g.have_nerd_font }

-- cursorword
require('mini.cursorword').setup {}

-- pairs
require('mini.pairs').setup {}

-- bufremove
require('mini.bufremove').setup {}

-- close buffer with <Ctrl-W>
vim.keymap.set('n', '<C-w>', '<CMD>lua MiniBufremove.delete(0, false)<CR>')

-- comment
require('mini.comment').setup {}

-- trailspace
require('mini.trailspace').setup {}

-- map
local map = require 'mini.map'
map.setup {
  integrations = {
    map.gen_integration.builtin_search(),
    map.gen_integration.diff(),
    map.gen_integration.diagnostic(),
    map.gen_integration.gitsigns(),
  },
  window = {
    focusable = false,
    side = 'right',
    show_integration_count = true,
    width = 6,
    winblend = 90,
  },
}

-- open map @ startup
vim.api.nvim_create_autocmd({ 'BufEnter', 'VimEnter' }, {
  callback = function() require('mini.map').open() end,
})
