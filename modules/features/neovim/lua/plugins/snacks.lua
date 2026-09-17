-- TODO: <Ctrl-Backspace> in picker insert mode

vim.pack.add { 'https://github.com/folke/snacks.nvim' }

local Snacks = require 'snacks'

---@type snacks.Config
local opts = {}

---@type snacks.explorer.Config
opts.explorer = {
  replace_netrw = false,
  trash = true,
}

---@type snacks.indent.Config
opts.indent = {
  enabled = true,
  animate = {
    enabled = true,
  },
  scope = {
    enabled = true,
  },
}

---@type snacks.words.Config
opts.words = {
  enabled = true,
}

---@type snacks.scope.Config
opts.scope = {
  enabled = true,
  treesitter = {
    enabled = true,
    injections = true,
  },
}

---@type snacks.statuscolumn.Config
opts.statuscolumn = {
  left = { 'git' },
  right = { 'fold' },
}

---@type snacks.words.Config
opts.words = {
  enabled = true,
}

---@type snacks.scroll.Config
opts.scroll = {
  enabled = not vim.g.neovide,
  animate = {
    easing = 'linear',
  },
  animate_repeat = {},
}

---@type snacks.notifier.Config
opts.notifier = {
  enabled = true,
  style = 'compact',
}

---@type snacks.lazygit.Config
opts.lazygit = {
  configure = true,
}

---@type snacks.zen.Config
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

---@type snacks.dashboard.Config
opts.dashboard = {
  enabled = true,
  preset = {
    pick = nil,
    keys = {
      -- TODO: lazygit shortcut?
      -- TODO: Snacks.picker.projects()
      -- TODO: Snacks.picker.notifications() ???
      -- TODO: Snacks.picker.marks()
      { icon = ' ', key = 'p', desc = 'Open file', action = ":lua Snacks.dashboard.pick('files')" },
      {
        icon = '󰙅 ',
        key = 'e',
        desc = 'Open file tree',
        action = function()
          Snacks.dashboard.pick 'explorer'
          Snacks.dashboard.update()
          -- TODO: close dashboard
        end,
      },
      { icon = ' ', key = 'f', desc = 'Search in files', action = ":lua Snacks.dashboard.pick('live_grep')" },
      { icon = ' ', key = 'r', desc = 'Recent files', action = ":lua Snacks.dashboard.pick('oldfiles')" },
      { icon = ' ', key = 'o', desc = 'Open file explorer', action = ':Oil' },
      {
        icon = ' ',
        key = 't',
        desc = 'Open terminal',
        action = function()
          Snacks.terminal.open()
          Snacks.dashboard.update()
          -- TODO: close dashboard
        end,
      },
      { icon = '󰋖 ', key = 'h', desc = 'Show help', action = ":lua Snacks.dashboard.pick('help')" },
      { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
    },
    header = nil,
  },
  sections = {
    { section = 'header' },
    { section = 'keys', gap = 1, padding = 1 },
  },
}

-- TODO: type ?
opts.styles = {
  zen = {
    width = 160, -- up from 120
    backdrop = {
      transparent = false,
    },
  },
  scratch = {
    width = 120, -- up from 100
    height = 40, -- up from 30
  },
}

---@type snacks.terminal.Config
opts.terminal = {
  win = {
    style = 'terminal',
    keys = {
      -- close terminal with <Esc>
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

---@type snacks.picker.Config
opts.picker = {
  focus = 'input',
  actions = {
    -- clear input if it isn't empty, otherwise move focus away
    input_escape = function(picker)
      if picker.input:get() ~= '' then
        picker.input:set ''
        return
      end

      -- TODO: don't reset cursor position to root dir after <Esc>
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
    lazygit = {
      win = {
        input = {
          keys = {
            -- TODO: don't close window with <Esc>
          },
        },
      },
    },
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

---@type snacks.scratch.Config
opts.scratch = {
  enabled = true,
}

Snacks.setup(opts)

------------------------------------------------------------------------------------

-- TODO: open pickers in other modes (insert, visual, command?)

-- open snacks file picker with <Ctrl-P> and <Shift-Ctrl-P>
vim.keymap.set({ 'n', 'v', 'i' }, '<C-p>', '<CMD>lua Snacks.picker.files()<CR>')
vim.keymap.set({ 'n', 'v', 'i' }, '<S-C-p>', '<CMD>lua Snacks.picker.files()<CR>')

-- open snacks grep picker with <Shift-Ctrl-F>
vim.keymap.set('n', '<S-C-f>', '<CMD>lua Snacks.picker.grep()<CR>')

-- open snacks buffer picker with <Ctrl-B> or <Space> --> bu
vim.keymap.set('n', '<C-b>', '<CMD>lua Snacks.picker.buffers()<CR>')
vim.keymap.set('n', '<leader>bu', '<CMD>lua Snacks.picker.buffers()<CR>')

-- open snacks help picker with <Shift-Ctrl-H>
vim.keymap.set('n', '<S-C-h>', '<CMD>lua Snacks.picker.help()<CR>')

-- open snacks notification history with <Space> -> no
vim.keymap.set('n', '<leader>no', '<CMD>lua Snacks.picker.notifications()<CR>')

-- open snacks lsp config picker with <Space> -> ls
vim.keymap.set('n', '<leader>ls', '<CMD>lua Snacks.picker.lsp_config()<CR>')

-- open snacks lsp diagnostics picker with <Space> -> er OR di
vim.keymap.set('n', '<leader>er', '<CMD>lua Snacks.picker.diagnostics()<CR>')
vim.keymap.set('n', '<leader>di', '<CMD>lua Snacks.picker.diagnostics()<CR>')

-- open snacks lazygit with <Space> -> lg
vim.keymap.set('n', '<leader>lg', '<CMD>lua Snacks.lazygit()<CR>')

-- open snacks zen mode with <Space> -> zz
vim.keymap.set('n', '<leader>zz', '<CMD>lua Snacks.zen()<CR>')

-- close buffer with <Ctrl-W>
vim.keymap.set('n', '<C-w>', '<CMD>lua Snacks.bufdelete()<CR>')

-- close all buffers with <Ctrl-K> -> <Ctrl-W>
vim.keymap.set('n', '<C-k><C-w>', '<CMD>lua Snacks.bufdelete.all()<CR>')

-- focus/ open snacks terminal with <Ctrl-T> and <Shift-Ctrl-T>
local open_terminal = function()
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
end

vim.keymap.set({ 'n', 't', 'i', 'v' }, '<C-t>', open_terminal)
vim.keymap.set({ 'n', 't', 'i', 'v' }, '<S-C-t>', open_terminal)

-- open snacks scratch file(s) with <Space> -> sf
vim.keymap.set('n', '<leader>sf', function()
  -- local scratch_files = Snacks.scratch.list()
  -- if #scratch_files == 0 then
  --   Snacks.scratch.open()
  --   return
  -- end

  -- TODO: input to create new scratch file w/ file type
  Snacks.scratch.select()
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

-- open scratch file (with file type input) with <Shift-Ctrl-N>
vim.keymap.set('n', '<S-C-n>', function()
  Snacks.input({}, function(value)
    if value ~= nil then Snacks.scratch.open { ft = value } end
  end)
end)

------------------------------------------------------------------------------------

-- Oil integration?
vim.api.nvim_create_autocmd('User', {
  pattern = 'OilActionsPost',
  callback = function(event)
    if event.data.actions[1].type == 'move' then Snacks.rename.on_rename_file(event.data.actions[1].src_url, event.data.actions[1].dest_url) end
  end,
})
