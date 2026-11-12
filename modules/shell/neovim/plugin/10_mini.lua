-- TODO: check if mini is installed or not

-- vim.pack.add {
--   { src = 'https://github.com/nvim-mini/mini.nvim' },
-- }

-- mini.basics
Config.now(function()
  if not Config.basics then return end
  require('mini.basics').setup {
    options = { basic = false },
  }
end)

-- mini.icons
Config.now(function()
  require('mini.icons').setup { style = 'glyph' }

  Config.later(MiniIcons.mock_nvim_web_devicons)
  Config.later(MiniIcons.tweak_lsp_kind)
end)

-- mini.notify
Config.now(function() require('mini.notify').setup() end)

-- mini.starter
Config.now(function()
  local starter = require 'mini.starter'
  starter.setup {
    autoopen = true,
    evaluate_single = true,
    items = {
      starter.sections.recent_files(10, true),
      { name = 'N: New file', action = 'enew', section = 'Shortcuts' },
      { name = 'P: Find files', action = 'lua require("fff").find_files()', section = 'Shortcuts' },
      { name = 'F: Live grep', action = 'lua require("fff").live_grep()', section = 'Shortcuts' },
      { name = 'E: Open file explorer', action = 'NvimTreeOpen', section = 'Shortcuts' },
      { name = 'O: Open oil', action = 'Oil', section = 'Shortcuts' },
      { name = 'Q: Quit', action = 'qa', section = 'Shortcuts' },
    },
    header = '',
    footer = nil,
  }
end)

-- mini.statuscolumn
Config.now(function() require('mini.statuscolumn').setup { dim_inactive = false } end)

-- mini.statusline
Config.now(function() require('mini.statusline').setup() end)

-- mini.tabline
Config.now(function()
  if Config.tabline ~= 'mini' then return end
  require('mini.tabline').setup()
end)

-- mini.extra
Config.later(function() require('mini.extra').setup() end)

-- mini.ai
Config.later(function() require('mini.ai').setup() end)

-- mini.align
Config.later(function() require('mini.align').setup() end)

-- mini.bracketed
Config.later(function() require('mini.bracketed').setup() end)

-- mini.bufremove
Config.later(function()
  local bufremove = require 'mini.bufremove'
  bufremove.setup()

  vim.keymap.set('n', '<C-w>', function() bufremove.delete(nil, false) end, { desc = 'Close buffer' })
  vim.keymap.set('n', '<C-k><C-w>', function()
    for _, buf_id in ipairs(Config.listed_buffer_ids()) do
      bufremove.delete(buf_id, false)
    end
  end, { desc = 'Close all buffers' })
end)

-- mini.clue
Config.later(function()
  local clue = require 'mini.clue'
  clue.setup {
    clues = {
      clue.gen_clues.g(),
    },
    triggers = {
      { mode = { 'n', 'x' }, keys = '<Leader>' },
      { mode = { 'n', 'x' }, keys = 'g' },
      { mode = 'n', keys = '<C-k>' },
    },
  }
end)

-- mini.comment
Config.later(function() require('mini.comment').setup {} end)

-- mini.cursorword
Config.later(function() require('mini.cursorword').setup {} end)

-- mini.diff
Config.later(function() require('mini.diff').setup {} end)

-- mini.hlpatterns
Config.later(function()
  local hipatterns = require 'mini.hipatterns'

  local highlighters = {}
  for _, word in ipairs {
    'todo',
    'note',
    'hack',
    'fixme',
    { 'warn', 'hack' },
    { 'fix', 'fixme' },
    { 'bug', 'fixme' },
    { 'docs', 'note' },
    { 'test', 'todo' },
  } do
    local w = type(word) == 'table' and word[1] or word
    local hl = type(word) == 'table' and word[2] or word
    highlighters[w] = {
      pattern = {
        string.format('()@%s()', w:upper()),
        string.format('()%s()', w:upper()),
        string.format('%s():()', w:upper()),
        string.format('%s ().*()', w:upper()),
        string.format('%s: ().*()', w:upper()),
      },
      group = string.format('MiniHipatterns%s', hl:sub(1, 1):upper() .. hl:sub(2)),
    }
  end

  hipatterns.setup {
    highlighters = vim.tbl_extend('force', highlighters, {
      hex_color = hipatterns.gen_highlighter.hex_color(),
    }),
  }
end)

-- mini.indentscope
Config.later(function()
  local indentscope = require 'mini.indentscope'
  indentscope.setup {
    draw = { animation = indentscope.gen_animation.none() },
  }
end)

-- mini.input
Config.later(function() require('mini.input').setup {} end)

-- mini.jump
Config.later(function() require('mini.jump').setup {} end)

-- mini.jump2d
Config.later(function() require('mini.jump2d').setup {} end)

-- mini.map
Config.later(function()
  local map = require 'mini.map'
  map.setup {
    integrations = {
      map.gen_integration.builtin_search(),
      map.gen_integration.diff(),
      map.gen_integration.diagnostic(),
      map.gen_integration.gitsigns(),
    },
    symbols = {
      encode = map.gen_encode_symbols.dot '4x2',
      scroll_line = '▶',
      scroll_view = '╎',
    },
    window = {
      focusable = false,
      side = 'right',
      show_integration_count = false,
      width = 10,
      winblend = 99,
    },
  }
end)

-- mini.move
Config.later(function()
  require('mini.move').setup {
    mappings = {
      -- visual mode
      left = '<S-Tab>',
      right = '<Tab>',
      up = '<A-Up>',
      down = '<A-Down>',
      -- normal mode
      line_left = '<S-Tab>',
      line_right = '<Tab>',
      line_up = '<A-Up>',
      line_down = '<A-Down>',
    },
  }
end)

-- mini.pairs
Config.later(function() require('mini.pairs').setup { modes = { command = true } } end)

-- mini.pick
Config.later(function()
  require('mini.pick').setup {
    window = {
      config = function()
        local height = math.floor(0.618 * vim.o.lines)
        local width = math.floor(0.618 * vim.o.columns)
        return {
          anchor = 'NW',
          height = height,
          width = width,
          row = math.floor(0.5 * (vim.o.lines - height)),
          col = math.floor(0.5 * (vim.o.columns - width)),
          border = 'rounded',
        }
      end,
    },
  }

  vim.keymap.set('n', '<S-C-h>', '<CMD>lua MiniPick.builtin.help()<CR>', { desc = 'Show help picker' })
  vim.keymap.set('n', '<C-b>', '<CMD>lua MiniPick.builtin.buffers()<CR>', { desc = 'Show buffer picker' })
  vim.keymap.set('n', '<leader>er', '<CMD>lua MiniExtra.pickers.diagnostic()<CR>', { desc = 'Show diagnostics picker' })
  vim.keymap.set('n', '<leader>di', '<CMD>lua MiniExtra.pickers.diagnostic()<CR>', { desc = 'Show diagnostics picker' })
end)

-- mini.surround
Config.later(function()
  if Config.surround ~= 'mini' then return end
  require('mini.surround').setup {}
end)

-- mini.trailspace
Config.later(function() require('mini.trailspace').setup {} end)
