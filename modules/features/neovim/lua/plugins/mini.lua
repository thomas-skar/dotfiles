vim.pack.add { 'https://github.com/nvim-mini/mini.nvim' }

-- icons
if vim.g.have_nerd_font then
  require('mini.icons').setup { style = 'glyph' }
  vim.cmd ':lua MiniIcons.mock_nvim_web_devicons()'
end

-- statusline
require('mini.statusline').setup { use_icons = vim.g.have_nerd_font }

-- notify
require('mini.notify').setup {
  lsp_progress = {
    enable = false,
  },
}

-- cursorword
require('mini.cursorword').setup {}

-- pairs
require('mini.pairs').setup {}
