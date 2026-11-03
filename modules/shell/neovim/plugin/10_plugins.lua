-- TODO: adjust plugin order
-- TODO: lazy load plugins
-- TODO: Config... methods ? (mini)

---@type "lualine"|"mini"|nil
Config.statusline = 'mini'

---@type "snacks"|"oil"|nil
Config.file_explorer = 'oil'

---@type "visual"|"mini"|nil
Config.surround = 'visual'

---@type boolean
Config.copilot = true

-- custom commands
vim.api.nvim_create_user_command('UpdatePlugins', function() vim.pack.update() end, {})
