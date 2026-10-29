-- TODO: adjust plugin order
-- TODO: lazy load plugins
-- TODO: Config... methods ? (mini)

-- TODO:
--  - schema-companion: https://github.com/cenk1cenk2/schema-companion.nvim
--  - yaml-compansion: https://github.com/mosheavni/yaml-companion.nvim

---@type "lualine"|"mini"|nil
Config.statusline = 'mini'

---@type "snacks"|"oil"|nil
Config.file_explorer = 'oil'

---@type "visual"|"mini"|nil
Config.surround = 'visual'

---@type boolean
Config.copilot = true
