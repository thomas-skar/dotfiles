-- TODO: <Ctrl-Backspace> in picker insert mode

vim.pack.add { 'https://github.com/folke/snacks.nvim' }

local Snacks = require 'snacks'

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
    -- inlay_hints = true,
  },
  center = true,
  show = {
    statusline = true,
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
      -- TODO: close dashboard after opening the explorer
      { icon = '󰙅 ', key = 'e', desc = 'Open file tree', action = ":lua Snacks.dashboard.pick('explorer')" },
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

-- TODO: keybinds (exit terminal mode with <Esc>)
opts.terminal = {
  win = {
    style = 'terminal',
    keys = {
      -- hide terminal with <Esc>
      term_normal = {
        '<Esc>',
        function(self)
          vim.cmd 'stopinsert'
          self:hide()
        end,
        mode = 't',
        expr = true,
      },
      -- TODO: go back to terminal mode with <Esc> ?
      term_normal_2 = {
        '<Esc>',
        function(self) self:hide() end,
        mode = { 'n', 'v' },
        expr = true,
      },
    },
  },
}

opts.picker = {
  focus = 'input',
  actions = {
    -- clear input if it isn't empty, otherwise move focus away
    input_escape = function(picker)
      if picker.input:get() ~= '' then
        picker.input:set ''
        return
      end

      picker:focus('list', { show = true })
    end,
    -- open the file picker
    file_picker = function() Snacks.picker.files() end,
    -- unfocus picker
    focus_main = function(picker) vim.api.nvim_set_current_win(picker.main) end,
  },
  win = {
    input = {
      keys = {
        -- close picker(s) with <Esc> by default
        ['<Esc>'] = { 'close', mode = { 'i', 'n' } },
      },
    },
  },
  sources = {
    files = {
      hidden = true,
      layout = { preset = 'telescope' },
    },
    grep = { layout = { preset = 'telescope' } },
    help = { layout = { preset = 'telescope' } },
    explorer = {
      hidden = true,
      finder = 'explorer',
      supports_live = true,
      tree = true,
      watch = true,
      diagnostics = true,
      git_status = true,
      git_untracked = true,
      follow_file = true,
      focus = 'list',
      auto_close = false,
      jump = { close = false },
      layout = {
        preset = 'sidebar',
        ---@diagnostic disable-next-line: assign-type-mismatch
        preview = { main = true, enabled = false },
      },
      win = {
        input = {
          title = 'Files (/)',
          keys = {
            ['<Esc>'] = { 'input_escape', mode = { 'i', 'n' } },
            -- open file picker with <Ctrl-P>
            ['<C-p>'] = { 'file_picker' },
            -- unfocus explorer with <Ctrl-E>
            ['<C-e>'] = { 'focus_main' },
          },
        },
        list = {
          keys = {
            -- don't close explorer with <Esc>
            ['<Esc>'] = { 'focus_main', mode = 'n' },
            -- open file picker with <Ctrl-P>
            ['<C-p>'] = { 'file_picker' },
            -- unfocus explorer with <Ctrl-E>
            ['<C-e>'] = { 'focus_main' },
            -- disable i
            ['i'] = '',
            -- toggle preview with P
            ['p'] = 'toggle_preview',
            -- default: close explorer with Q
            ['q'] = 'close',
          },
        },
        preview = {
          border = 'rounded',
          focusable = false,
          title = 'PREVIEW',
        },
      },
    },
  },
}

opts.scratch = {
  enabled = true,
}

Snacks.setup(opts)

------------------------------------------------------------------------------------

-- TODO: open pickers in other modes (insert, visual, command?)

-- open snacks file picker with <Ctrl-P> and <Shift-Ctrl-P>
vim.keymap.set('n', '<C-p>', '<CMD>lua Snacks.picker.files()<CR>')
vim.keymap.set('n', '<S-C-p>', '<CMD>lua Snacks.picker.files()<CR>')

-- open snacks grep picker with <Shift-Ctrl-F>
vim.keymap.set('n', '<S-C-f>', '<CMD>lua Snacks.picker.grep()<CR>')

-- open snacks buffer picker with <Ctrl-B>
vim.keymap.set('n', '<C-b>', '<CMD>lua Snacks.picker.buffers()<CR>')

-- open snacks help picker with <Shift-Ctrl-H>
vim.keymap.set('n', '<S-C-h>', '<CMD>lua Snacks.picker.help()<CR>')

-- open snacks notification history with <Space> -> no
vim.keymap.set('n', '<leader>no', '<CMD>lua Snacks.picker.notifications()<CR>')

-- open snacks lazygit with <Space> -> lg
vim.keymap.set('n', '<leader>lg', '<CMD>lua Snacks.lazygit()<CR>')

-- open snacks zen mode with <Space> -> zz
vim.keymap.set('n', '<leader>zz', '<CMD>lua Snacks.zen()<CR>')

-- close buffer with <Ctrl-W>
vim.keymap.set('n', '<C-w>', '<CMD>lua Snacks.bufdelete()<CR>')

-- close all buffers with <Ctrl-K> -> <Ctrl-W>
vim.keymap.set('n', '<C-k><C-w>', '<CMD>lua Snacks.bufdelete.all()<CR>')

-- focus/ open snacks terminal with <Ctrl-T>
vim.keymap.set({ 'n', 't', 'i', 'v' }, '<C-t>', function()
  local term = Snacks.terminal.get()
  if term == nil then
    -- .get() creates a new temrinal if none exists
    return
  end

  -- hide terminal if it's already focused
  if vim.api.nvim_get_current_buf() == term.buf then
    term:hide()
    return
  end

  term:show():focus()
end)

-- open snacks scratch file(s) with <Space> -> sf
vim.keymap.set('n', '<leader>sf', function()
  local scratch_files = Snacks.scratch.list()
  if #scratch_files == 0 then
    Snacks.scratch.open()
    return
  end

  -- TODO: file type?
  Snacks.scratch()
end)

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

-- Oil integration?
vim.api.nvim_create_autocmd('User', {
  pattern = 'OilActionsPost',
  callback = function(event)
    if event.data.actions[1].type == 'move' then Snacks.rename.on_rename_file(event.data.actions[1].src_url, event.data.actions[1].dest_url) end
  end,
})
