-- leader key(s)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- enable nerd fonts
vim.g.have_nerd_font = true

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- disable providers?
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
vim.opt.cursorcolumn = false
vim.opt.winborder = 'rounded'
vim.opt.pumborder = 'rounded'
vim.opt.laststatus = 3
vim.opt.ruler = true

-- indentation
vim.opt.autoindent = true
vim.opt.smartindent = true

-- delays, etc
vim.opt.updatetime = 250
vim.opt.timeoutlen = 250

-- search?
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- scrolling
vim.opt.scrolloff = 5

-- splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- completion menu
vim.opt.autocomplete = false
vim.opt.completeopt = 'menu,menuone,noselect,popup'

-- clipboard
vim.opt.clipboard = 'unnamedplus'

-- enable mouse clicks
vim.opt.mouse = 'a'
vim.opt.mousemoveevent = true

-- undofile
vim.opt.undofile = true

-- swapfile
vim.opt.swapfile = false

-- hidden characters
vim.opt.list = false
vim.opt.listchars:append { eol = '↲', tab = '>-', trail = '~' }

-- navigation (jump between lines with arrow keys)
vim.opt.whichwrap:append '<,>,[,]'

-- spaces and tabs
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smarttab = true

-- navigation
vim.opt.virtualedit:append 'onemore'

-- line wrap
vim.opt.wrap = false
