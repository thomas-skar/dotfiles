
if vim.loader then
    vim.loader.enable()
end

vim.g.mapleader = " "

vim.o.mouse = "a"
vim.o.breakindent = true
vim.o.cursorline = true
vim.o.linebreak = true
vim.o.list = true
vim.o.number = true
vim.o.pumborder = "single"
vim.o.winborder = "single"
vim.o.ruler = true
vim.o.autoindent = true
vim.o.expandtab = true
vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.infercase = true
vim.o.smartcase = true
vim.o.smartindent = true

-- add plugins
vim.pack.add({
    "https://github.com/loctvl842/monokai-pro.nvim",
    'https://github.com/nvim-mini/mini.icons',
    'https://github.com/nvim-mini/mini.statusline',
    'https://github.com/nvim-mini/mini.tabline',
    'https://github.com/nvim-mini/mini.cmdline',
    'https://github.com/nvim-mini/mini.notify',
    'https://github.com/nvim-mini/mini.indentscope',
    'https://github.com/nvim-mini/mini.cursorword',
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/nvim-telescope/telescope.nvim",
    'https://github.com/stevearc/oil.nvim'
})

-- color scheme
require("monokai-pro").setup({
    filter = "pro",
    devicons = true,
})
vim.cmd.colorscheme("monokai-pro")

-- icons
require("mini.icons").setup()

-- statusline
require("mini.statusline").setup()

-- tabline
require("mini.tabline").setup()

-- cmdline
require("mini.cmdline").setup({
    autocomplete = {
        enable = true,
        map_arrows = true
    },
    autocorrect = {
        enable = true
    },
    autopeek = {
        enable = true
    }
})

-- notify
require("mini.notify").setup({
    lsp_progress = {
        enable = true
    }
})

-- indentscope
require("mini.indentscope").setup({
    draw = {
        animation = require('mini.indentscope').gen_animation.none()
    }
})

-- cursorword
require("mini.cursorword").setup()

-- telescope
require("telescope").setup()

-- oil
require("oil").setup()
