-- DOCS: https://echasnovski.com/blog/2026-03-13-a-guide-to-vim-pack
-- DOCS: https://nvim-mini.org/MiniMax/configs/nvim-0.12/

-- global config table
_G.Config = {}

-- enable experimental lua module loader
if vim.loader then vim.loader.enable() end

-- enable experimental ui2
require('vim._core.ui2').enable { enable = true }

------------------------------------------------------------------------------------

---@type "lualine"|"mini"|nil
Config.statusline = 'mini'

---@type "snacks"|"oil"|nil
Config.file_explorer = 'oil'

---@type "visual"|"mini"|nil
Config.surround = 'visual'

---@type boolean|nil
Config.enable_hover_plugin = false
