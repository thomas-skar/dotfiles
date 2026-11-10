if Config.tree == 'nvim-tree' then
  vim.pack.add {
    { src = 'https://github.com/nvim-tree/nvim-tree.lua' },
  }

  local function on_attach(bufnr)
    local api = require 'nvim-tree.api'

    api.map.on_attach.default(bufnr)

    -- TODO: move "up" with arrow left
    -- TODO: expand folder with arrow right
    vim.keymap.set('n', '?', api.tree.toggle_help)
  end

  ---@type nvim_tree.config
  local config = {
    on_attach = on_attach,
    hijack_cursor = true,
    auto_reload_on_write = true,
    disable_netrw = true,
    hijack_netrw = false,
    hijack_unnamed_buffer_when_opening = false,
    sync_root_with_cwd = true,
    sort = {
      sorter = 'name',
      folders_first = true,
    },
    view = {
      centralize_selection = true,
      cursorline = true,
      side = 'left',
      number = false,
      width = {
        min = 25,
        max = -1,
        padding = 1,
      },
    },
    renderer = {
      add_trailing = true,
      group_empty = true,
      indent_width = 2,
      highlight_git = 'name',
      highlight_hidden = 'name',
      highlight_opened_files = 'name',
      indent_markers = {
        enable = true,
        icons = {
          corner = '|',
          edge = '│',
          item = '│',
          bottom = '',
          none = '',
        },
      },
      icons = {
        hidden_placement = 'right_align',
        modified_placement = 'right_align',
        show = {
          git = false,
          folder = false,
          hidden = true,
          modified = false,
        },
      },
    },
    git = {
      enable = true,
    },
    diagnostics = {
      enable = true,
    },
    modified = {
      enable = true,
    },
    filesystem_watchers = {
      enable = true,
    },
    actions = {
      change_dir = {
        enable = false,
        restrict_above_cwd = true,
      },
    },
    hijack_directories = { enable = false },
    update_focused_file = {
      enable = true,
      update_root = { enable = false },
    },
  }

  require('nvim-tree').setup(config)
end
