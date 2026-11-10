local hipatterns = require 'mini.hipatterns'

-- source: https://github.com/nvim-mini/mini.nvim/discussions/783
local highlighters = {}
for _, word in ipairs {
  'todo',
  'note',
  'hack',
  'fixme',
  { 'warn', 'hack' },
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
