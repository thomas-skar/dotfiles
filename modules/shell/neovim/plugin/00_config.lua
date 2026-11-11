---@type "bufferline"|"mini"|nil
Config.tabline = 'bufferline'

---@type "visual"|"mini"|nil
Config.surround = 'visual'

---@type "neo-tree"|"nvim-tree"|"snacks"|nil
Config.tree = 'snacks'

---@type boolean
Config.basics = true

---@type boolean
Config.copilot = true

-- custom commands
vim.api.nvim_create_user_command('UpdatePlugins', function() vim.pack.update() end, {})
