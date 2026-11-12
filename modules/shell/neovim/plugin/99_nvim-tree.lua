Config.later(function()
  if Config.tree ~= 'nvim-tree' then return end

  Config.add { { src = 'https://github.com/nvim-tree/nvim-tree.lua' } }

  ---@type nvim_tree.config
  local config = {
    on_attach = 'default',
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
      indent_width = 1,
      highlight_git = 'name',
      highlight_hidden = 'name',
      highlight_opened_files = 'name',
      indent_markers = {
        enable = false,
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
    filters = {
      custom = { '^.git$' },
    },
  }

  require('nvim-tree').setup(config)

  -- FIXME:
  vim.keymap.set('n', '<C-e>', '<CMD>NvimTreeToggle<CR>', { desc = 'Toggle file tree' })
end)
