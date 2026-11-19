if Config.tree ~= 'neo-tree' then return end

local later, add, map = Config.later, Config.plugins.add, Config.map

later(function()
  add {
    { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = vim.version.range '3' },
    { src = 'https://github.com/nvim-lua/plenary.nvim' },
    { src = 'https://github.com/MunifTanjim/nui.nvim' },
  }

  ---@type boolean
  Config.flags.neo_tree_preview = false

  -- TODO: close directory with <Left>
  -- TODO: expand directory with <Right>

  ---@type neotree.Config
  local config = {
    add_blank_line_at_top = false,
    close_if_last_window = true,
    enable_cursor_hijack = true, -- TODO: better hijack?
    hide_root_node = true,
    popup_border_style = 'rounded',
    source_selector = {
      winbar = false,
      statusline = false,
      truncation_character = '…',
    },
    default_component_configs = {
      indent = {
        with_markers = true,
      },
      name = {
        trailing_slash = true,
        highlight_opened_files = false,
      },
    },
    window = {
      position = 'left',
      width = 30,
      auto_expand_width = true,
    },
    filesystem = {
      bind_to_cwd = true,
      filtered_items = {
        show_hidden_count = false,
        children_inherit_highlights = true,
        hide_dotfiles = false,
        hide_gitignored = false,
      },
      group_empty_dirs = true,
      follow_current_file = {
        enabled = true,
        leave_dirs_open = false,
      },
      hijack_netrw_behavior = 'open_default',
      use_libuv_file_watcher = true,
      window = {
        mappings = {
          ['<S-p>'] = function(state)
            state.config = { use_float = true }
            state.commands.toggle_preview(state)
            Config.flags.neo_tree_preview = not Config.flags.neo_tree_preview
          end,
        },
      },
    },
    event_handlers = {
      {
        event = 'neo_tree_buffer_enter',
        handler = function()
          if not Config.flags.neo_tree_preview then return end
          if not require('neo-tree.sources.common.preview').is_active() then
            ---@type neotree.State|neotree.StateWithTree
            local state = require('neo-tree.sources.manager').get_state 'filesystem'
            if not state.tree then return end
            state.config = { use_float = true }
            ---@diagnostic disable-next-line: param-type-mismatch
            state.commands.toggle_preview(state)
          end
        end,
      },
    },
  }

  require('neo-tree').setup(config)

  -- TODO: escape focus with <Esc> or <C-e>

  map('n', '<C-e>', '<CMD>Neotree<CR>', 'Open neo-tree')

  ---@diagnostic disable-next-line: duplicate-set-field
  Config.plugins.open_tree = function() vim.cmd 'Neotree show' end
end)
