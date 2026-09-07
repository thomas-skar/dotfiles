--[[ options ]]
do
  require('vim._core.ui2').enable {
    enable = true,
  }

  vim.loader.enable()

  vim.g.mapleader = ' '
  vim.g.maplocalleader = ' '
  vim.g.have_nerd_font = true

  -- disable netrw
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1

  -- providers?
  vim.g.loaded_node_provider = 0
  vim.g.loaded_python3_provider = 0
  vim.g.loaded_perl_provider = 0
  vim.g.loaded_ruby_provider = 0

  -- display
  vim.opt.termguicolors = true
  vim.opt.number = true
  vim.opt.relativenumber = false
  vim.opt.showmode = false
  vim.opt.signcolumn = 'yes'
  vim.opt.cursorline = true
  vim.opt.winborder = 'rounded'
  vim.opt.pumborder = 'rounded'
  vim.opt.laststatus = 3

  -- search
  vim.opt.ignorecase = true
  vim.opt.smartcase = true

  -- splits
  vim.opt.splitright = true
  vim.opt.splitbelow = true

  vim.opt.mouse = 'a'
end

--[[ keymaps ]]
do
  vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

  vim.keymap.set('n', '<C-e>', '<cmd>NvimTreeToggle<CR>')
end

--[[ plugins: colorscheme ]]
do
  vim.pack.add { 'https://github.com/loctvl842/monokai-pro.nvim' }
  require('monokai-pro').setup {
    filter = 'pro',
    devicons = true,
  }
  vim.cmd.colorscheme 'monokai-pro'
end

--[[ plugins: mini ]]
do
  vim.pack.add { 'https://github.com/nvim-mini/mini.nvim' }

  if vim.g.have_nerd_font then
    require('mini.icons').setup { style = 'ascii' }
    vim.cmd ':lua MiniIcons.mock_nvim_web_devicons()'
  end
  require('mini.statusline').setup { use_icons = vim.g.have_nerd_font }
  require('mini.tabline').setup {}
  require('mini.cmdline').setup {}
  require('mini.notify').setup {}
  require('mini.indentscope').setup {}
  require('mini.cursorword').setup {}
end

--[[ plugins: nvim-tree ]]
do
  vim.pack.add { 'https://github.com/nvim-tree/nvim-tree.lua' }
  require('nvim-tree').setup {}
end

--[[ plugins: telescope ]]
do
end

--[[ lsp ]]
do
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  vim.lsp.config('*', {
    capabilities = capabilities,
  })

  vim.lsp.config('lua-language-server', {
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim' },
        },
        telemetry = {
          enable = false,
        },
      },
    },
  })

  vim.lsp.enable { 'lua_ls' }
end

--[[ formatting ]]
do
end

--[[ autocomplete ]]
do
end

--[[ treesitter ]]
do
end
