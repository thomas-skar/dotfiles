vim.pack.add { 'https://github.com/nvim-mini/mini.nvim' }

-- icons
if vim.g.have_nerd_font then
  require('mini.icons').setup { style = 'ascii' }
  vim.cmd ':lua MiniIcons.mock_nvim_web_devicons()'
end

-- statusline
require('mini.statusline').setup { use_icons = vim.g.have_nerd_font }

-- tabline
require('mini.tabline').setup {}

-- cmdline
require('mini.cmdline').setup {
  autocomplete = {
    enable = true,
    map_arrows = true,
  },
}

-- notify
require('mini.notify').setup {
  lsp_progress = {
    enable = false,
  },
}

-- indentscope
require('mini.indentscope').setup {
  draw = {
    animation = require('mini.indentscope').gen_animation.none(),
  },
}

-- cursorword
require('mini.cursorword').setup {}
