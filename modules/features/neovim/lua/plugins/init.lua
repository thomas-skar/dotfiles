-- TODO: https://echasnovski.com/blog/2026-03-13-a-guide-to-vim-pack
-- TODO: lazy loading

--[[ custom flags ]]
do
  ---@type "lualine"|"mini"|nil
  vim.g.statusline = 'mini'

  ---@type boolean|nil
  vim.g.enable_noice = false

  ---@type boolean|nil
  vim.g.enable_hover = false
end

require 'plugins.copilot'
require 'plugins.blink'
require 'plugins.conform'
require 'plugins.mini'
require 'plugins.monokai-pro'
require 'plugins.oil'
require 'plugins.todo-comments'
require 'plugins.treesitter'
require 'plugins.bufferline'
require 'plugins.snacks'
require 'plugins.markview'
require 'plugins.gitsigns'
require 'plugins.satellite'
require 'plugins.lualine'
require 'plugins.rainbow-delimiters'
require 'plugins.lazydev'
require 'plugins.hover'
require 'plugins.noice'
