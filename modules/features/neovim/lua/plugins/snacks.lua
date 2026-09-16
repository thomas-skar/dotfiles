-- TODO: <Ctrl-Backspace> in picker insert mode

vim.pack.add { 'https://github.com/folke/snacks.nvim' }

---@type snacks.Config
local opts = {}

opts.explorer = {
  replace_netrw = false,
  trash = true,
}

opts.indent = {
  enabled = true,
  animate = {
    enabled = true,
  },
  scope = {
    enabled = true,
  },
}

opts.words = {
  enabled = true,
}

opts.scope = {
  enabled = true,
  treesitter = {
    enabled = true,
    injections = true,
  },
}

opts.statuscolumn = {
  enabled = true,
}

opts.words = {
  enabled = true,
}

opts.scroll = {
  enabled = not vim.g.neovide,
  animate = {
    easing = 'linear',
  },
}

opts.notifier = {
  enabled = true,
  style = 'compact',
}

opts.lazygit = {
  configure = true,
}

opts.zen = {
  toggles = {
    dim = false,
    git_signs = false,
    mini_diff_signs = true,
    diagnostics = true,
    inlay_hints = true,
  },
  center = true,
  show = {
    statusline = false,
    tabline = false,
  },
  win = {
    style = 'zen',
  },
}

opts.dashboard = {
  enabled = true,
  preset = {
    pick = nil,
    keys = {
      { icon = ' ', key = 'p', desc = 'Open file', action = ":lua Snacks.dashboard.pick('files')" },
      { icon = ' ', key = 'f', desc = 'Search in files', action = ":lua Snacks.dashboard.pick('live_grep')" },
      { icon = ' ', key = 'r', desc = 'Recent files', action = ":lua Snacks.dashboard.pick('oldfiles')" },
      { icon = ' ', key = 'o', desc = 'Open file explorer', action = ':Oil' },
      { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
    },
    header = nil,
  },
  sections = {
    { section = 'header' },
    { section = 'keys', gap = 1, padding = 1 },
  },
}

opts.styles = {
  zen = {
    width = 160, -- up from 120
    backdrop = {
      transparent = false,
    },
  },
}

-- TODO: keybinds
opts.terminal = {
  win = {
    style = 'terminal',
  },
}

opts.picker = {
  focus = 'input',
  actions = {
    -- open the file picker
    file_picker = function() Snacks.picker.files() end,
    -- unfocus picker
    focus_main = function(picker) vim.api.nvim_set_current_win(picker.main) end,
  },
  sources = {
    files = {
      hidden = true,
      layout = { preset = 'telescope' },
      win = {
        input = {
          keys = {
            -- close window with <Esc>
            ['<Esc>'] = { 'close', mode = 'i' },
          },
        },
      },
    },
    grep = {
      layout = {
        preset = 'telescope',
      },
      win = {
        input = {
          keys = {
            -- close window with <Esc>
            ['<Esc>'] = { 'close', mode = 'i' },
          },
        },
      },
    },
    help = {
      layout = {
        preset = 'telescope',
      },
      win = {
        input = {
          keys = {
            -- close window with <Esc>
            ['<Esc>'] = { 'close', mode = 'i' },
          },
        },
      },
    },
    explorer = {
      focus = 'list',
      finder = 'explorer',
      hidden = true,
      tree = true,
      watch = true,
      follow_file = true,
      jump = {
        close = false,
      },
      layout = {
        preset = 'sidebar',
        -- auto_hide = { 'input' },
        -- preview = 'main',
      },
      win = {
        input = {
          keys = {
            -- don't close explorer with <Esc>
            ['<Esc>'] = { '', mode = 'n' }, -- TODO: clear input with <Esc> in insert mode
            -- open file picker with <Ctrl-P>
            ['<C-p>'] = { 'file_picker' },
            -- unfocus explorer with <Ctrl-E>
            ['<C-e>'] = { 'focus_main' },
          },
        },
        list = {
          keys = {
            -- don't close explorer with <Esc>
            ['<Esc>'] = { '', mode = 'n' },
            -- open file picker with <Ctrl-P>
            ['<C-p>'] = { 'file_picker' },
            -- unfocus explorer with <Ctrl-E>
            ['<C-e>'] = { 'focus_main' },
          },
        },
      },
    },
  },
}

require('snacks').setup(opts)

------------------------------------------------------------------------------------

-- TODO: close explorer with <Ctrl-E> when it is focused

-- open snacks file picker with <Ctrl-P>
vim.keymap.set('n', '<C-p>', '<CMD>lua Snacks.picker.files()<CR>')

-- open snacks grep picker with <Shift-Ctrl-F>
vim.keymap.set('n', '<S-C-f>', '<CMD>lua Snacks.picker.grep()<CR>')

-- open snacks buffer picker with <Ctrl-B>
vim.keymap.set('n', '<C-b>', '<CMD>lua Snacks.picker.buffers()<CR>')

-- open snacks help picker with <Shift-Ctrl-H>
vim.keymap.set('n', '<S-C-h>', '<CMD>lua Snacks.picker.help()<CR>')

-- open snacks terminal with <Ctrl-T>
vim.keymap.set({ 'n', 't' }, '<C-t>', '<CMD>lua Snacks.terminal.toggle()<CR>')

-- open snacks notification history with <Space> -> no
vim.keymap.set('n', '<leader>no', '<CMD>lua Snacks.picker.notifications()<CR>')

-- open snacks lazygit with <Space> -> lg
vim.keymap.set('n', '<leader>lg', '<CMD>lua Snacks.lazygit()<CR>')

-- open snacks zen mode with <Space> -> zz
vim.keymap.set('n', '<leader>zz', '<CMD>lua Snacks.zen()<CR>')

-- (open and) move focus between the snacks explorer and the "main" buffer with <Ctrl-E>
vim.keymap.set('n', '<C-e>', function()
  local explorer_pickers = Snacks.picker.get { source = 'explorer' }
  if #explorer_pickers == 0 then
    Snacks.explorer.reveal()
    return
  end
  for _, v in pairs(explorer_pickers) do
    if not v:is_focused() then v:focus() end
  end
end)

------------------------------------------------------------------------------------

-- open the snacks explorer @ startup ONCE
vim.api.nvim_create_autocmd('VimEnter', {
  once = true,
  callback = function()
    -- local window_id = vim.api.nvim_get_current_win()
    local explorer_pickers = Snacks.picker.get { source = 'explorer' }
    if #explorer_pickers == 0 then
      Snacks.explorer.reveal() -- vim.api.nvim_set_current_win(window_id) -- TODO: focus main buffer
    end
  end,
})
