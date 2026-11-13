local later, add, map = Config.later, Config.add, Config.map
local tree = Config.tree

later(function()
  if tree ~= 'neo-tree' then return end

  add {
    { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = vim.version.range '3' },
    { src = 'https://github.com/nvim-lua/plenary.nvim' },
    { src = 'https://github.com/MunifTanjim/nui.nvim' },
  }

  ---@type neotree.Config
  local config = {
    default_component_configs = {
      indent = {
        enabled = true,
        with_markers = true,
      },
    },
    filesystem = {
      follow_current_file = {
        enabled = true,
        leave_dirs_open = false,
      },
      group_empty_dirs = true,
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
      },
    },
    add_blank_line_at_top = false,
    close_if_last_window = true,
    enable_cursor_hijack = true,
    hide_root_node = true,
    window = {
      position = 'left',
      width = 30,
      auto_expand_width = true,
    },
  }

  require('neo-tree').setup(config)

  -- TODO: escape focus with <Esc> or <C-e>

  map('n', '<C-e>', '<CMD>Neotree<CR>', 'Open neo-tree')
end)
