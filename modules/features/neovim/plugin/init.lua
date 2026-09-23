-- NOTE: all modules in this directory are sourced automatically @ startup

-- TODO: number files so they're imported in the correct order (01_, 02_, etc)
-- TODO: fix lazydev <-> blink
-- TODO: lazy load plugins:
-- DOCS: https://echasnovski.com/blog/2026-03-13-a-guide-to-vim-pack

do
  ---@type "lualine"|"mini"|nil
  vim.g.statusline = 'mini'

  ---@type "snacks"|"oil"|nil
  vim.g.file_explorer = 'oil'

  ---@type "visual"|"mini"|nil
  vim.g.surround = 'visual'

  ---@type boolean|nil
  vim.g.enable_noice = false

  ---@type boolean|nil
  vim.g.enable_hover = false
end
