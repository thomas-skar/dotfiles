-- NOTE: all modules in this directory are sourced automatically @ startup

-- TODO: lazy load plugins
-- DOCS: https://echasnovski.com/blog/2026-03-13-a-guide-to-vim-pack

do
  ---@type "lualine"|"mini"|nil
  vim.g.statusline = 'mini'

  ---@type "snacks"|"oil"|nil
  vim.g.file_explorer = 'oil'

  ---@type boolean|nil
  vim.g.enable_noice = false

  ---@type boolean|nil
  vim.g.enable_hover = false
end
