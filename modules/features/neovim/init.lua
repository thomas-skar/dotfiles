
if vim.loader then
    vim.loader.enable()
end

-- options
vim.g.mapleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.o.mouse = "a"
vim.o.breakindent = true
vim.o.cursorline = true
vim.o.linebreak = true
vim.o.list = true
vim.o.number = true
vim.o.ruler = true
vim.o.autoindent = true
vim.o.expandtab = true
vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.infercase = true
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.spelloptions = 'camel'
vim.o.virtualedit = 'block'
vim.o.formatoptions = 'rqnl1j'
vim.opt.signcolumn = "yes"
vim.opt.fillchars = "eob: "
vim.opt.termguicolors = true

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
    'https://github.com/stevearc/oil.nvim',
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/nvim-telescope/telescope.nvim",
    "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
})

vim.api.nvim_create_autocmd("PackChanged", {
    callback = function(ev)
        if ev.data.spec.name == "telescope-fzf-native.nvim" and (ev.data.kind == "install" or ev.data.kind == "update") then
            vim.system({ "make" }, { cwd = ev.data.path })
        end
    end
})

--  setup plugins
require("monokai-pro").setup({
    filter = "pro",
    devicons = true,
})
vim.cmd.colorscheme("monokai-pro")

require("mini.icons").setup()

require("mini.statusline").setup()

require("mini.tabline").setup()

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

require("mini.notify").setup({
    lsp_progress = {
        enable = true
    }
})

require("mini.indentscope").setup({
    draw = {
        animation = require('mini.indentscope').gen_animation.none()
    }
})

require("mini.cursorword").setup()

require("oil").setup({
    default_file_explorer = true,
    delete_to_trash = true,
    view_options = {
        show_hidden = true,
    },
    float = {
        border = "rounded",
    },
})


local telescope = require("telescope")

telescope.setup({
    defaults = {
        mappings = {
            i = {
                ["<esc>"] = telescope.actions.close,
            },
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        }
    }
})

telescope.load_extension("fzf")


-- keymaps
vim.keymap.set({"n","v"}, "<C-f>", "/", {desc = "Search (Ctrl+F)"})
vim.keymap.set({"n"}, "<Esc>", "<CMD>nohlsearch<CR>", {silent = true, desc = "Exit search (ESC)"})

vim.keymap.set({"n","v","i"}, "<C-p>", "<CMD>Telescope find_files<CR>", {desc = "Telescope file picker (Ctrl+P)"})
vim.keymap.set({"n","v","i"}, "<S-C-f>", "<CMD>Telescope grep_string<CR>", {desc = "Telescope find in files (Ctrl+F)"})

vim.keymap.set({"n","v","i"}, "<C-o>", "<CMD>Oil --float<CR>", {desc = "Open Oil (Ctrl+O)"})
