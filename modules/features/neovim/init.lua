if vim.loader then vim.loader.enable() end

require('vim._core.ui2').enable {
  enable = true,
}

------------------------------------------------------------------------------------

-- leader key(s)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- enable nerd fonts
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

-- delays, etc
vim.o.updatetime = 500

-- search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- completion menu
vim.o.autocomplete = true
vim.opt.completeopt = 'menu,menuone,noselect,popup'

-- clipboard
vim.opt.clipboard = 'unnamedplus'

-- mouse mode
vim.opt.mouse = 'a'

------------------------------------------------------------------------------------

require 'autocmds'
require 'keymaps'
require 'lsp'
require 'plugins'
