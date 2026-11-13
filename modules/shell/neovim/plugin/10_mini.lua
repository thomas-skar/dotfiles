-- DOCS: https://nvim-mini.org/MiniMax/configs/nvim-0.12/

local now, later, maybe, map = Config.now, Config.later, Config.maybe, Config.map
local basics, tabline, surround, files = Config.basics, Config.tabline, Config.surround, Config.files

-- TODO: check if mini is installed or not
-- vim.pack.add {
--   { src = 'https://github.com/nvim-mini/mini.nvim' },
-- }

-- mini.basics
now(function()
  if not basics then return end
  require('mini.basics').setup {
    options = { basic = false },
  }
end)

-- mini.icons
now(function()
  require('mini.icons').setup { style = 'glyph' }

  later(MiniIcons.mock_nvim_web_devicons)
  later(MiniIcons.tweak_lsp_kind)
end)

-- mini.notify
now(function() require('mini.notify').setup() end)

-- mini.starter
now(function()
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
now(function() require('mini.statuscolumn').setup { dim_inactive = false } end)

-- mini.statusline
now(function() require('mini.statusline').setup() end)

-- mini.tabline
now(function()
  if tabline ~= 'mini' then return end

  require('mini.tabline').setup { show_icons = true, tabpage_section = 'none' }

  local get_buffers = Config.listed_buffer_ids

  ---@param index number
  local function focus_tab(index)
    ---@type integer[]
    local buffers = get_buffers()
    ---@type integer|nil
    local buf = nil
    if index == 0 then
      buf = buffers[#buffers]
    else
      buf = buffers[index]
    end
    if buf then vim.api.nvim_set_current_buf(buf) end
  end

  for i = 0, 9 do
    map('n', '<A-' .. i .. '>', function() focus_tab(i) end, 'Focus tab ' .. i)
  end
end)

-- mini.files
maybe(function()
  if files ~= 'mini' then return end

  local mf = require 'mini.files'
  mf.setup {
    mapping = {
      -- FIX: doesn't work
      go_in = '<Right>',
      go_out = '<Left>',
    },
    options = { use_as_default_explorer = true },
    windows = { preview = true },
  }

  local function toggle()
    if mf.close() == nil then mf.open() end
  end

  map('n', '<S-C-o>', toggle, 'Toggle mini.files')
  map('n', '<leader>fe', toggle, 'Toggle mini.files')
end)

-- mini.extra
later(function() require('mini.extra').setup() end)

-- mini.ai
later(function() require('mini.ai').setup() end)

-- mini.align
later(function() require('mini.align').setup() end)

-- mini.bracketed
later(function() require('mini.bracketed').setup() end)

-- mini.bufremove
later(function()
  local bufremove = require 'mini.bufremove'
  bufremove.setup()

  map('n', '<C-w>', function() bufremove.delete(nil, false) end, 'Close buffer')
  map('n', '<C-k><C-w>', function()
    for _, buf_id in ipairs(Config.listed_buffer_ids()) do
      bufremove.delete(buf_id, false)
    end
  end, 'Close all buffers')
end)

-- mini.clue
later(function()
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
later(function() require('mini.comment').setup {} end)

-- mini.cursorword
later(function() require('mini.cursorword').setup {} end)

-- mini.diff
later(function() require('mini.diff').setup {} end)

-- mini.hlpatterns
later(function()
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
later(function()
  local indentscope = require 'mini.indentscope'
  indentscope.setup {
    draw = { animation = indentscope.gen_animation.none() },
  }
end)

-- mini.input
later(function() require('mini.input').setup {} end)

-- mini.jump
later(function() require('mini.jump').setup {} end)

-- mini.jump2d
later(function() require('mini.jump2d').setup {} end)

-- mini.map
later(function()
  local minimap = require 'mini.map'
  minimap.setup {
    integrations = {
      minimap.gen_integration.builtin_search(),
      minimap.gen_integration.diff(),
      minimap.gen_integration.diagnostic(),
      minimap.gen_integration.gitsigns(),
    },
    symbols = {
      encode = minimap.gen_encode_symbols.dot '4x2',
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
later(function()
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
later(function() require('mini.pairs').setup { modes = { command = true } } end)

-- mini.pick
later(function()
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

  map('n', '<S-C-h>', '<CMD>lua MiniPick.builtin.help()<CR>', 'Show help picker')
  map('n', '<C-b>', '<CMD>lua MiniPick.builtin.buffers()<CR>', 'Show buffer picker')
  map('n', '<leader>er', '<CMD>lua MiniExtra.pickers.diagnostic()<CR>', 'Show diagnostics picker')
  map('n', '<leader>di', '<CMD>lua MiniExtra.pickers.diagnostic()<CR>', 'Show diagnostics picker')
end)

-- mini.surround
later(function()
  if surround ~= 'mini' then return end
  require('mini.surround').setup {}
end)

-- mini.trailspace
later(function() require('mini.trailspace').setup {} end)
