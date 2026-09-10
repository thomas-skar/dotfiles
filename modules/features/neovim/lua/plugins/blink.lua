-- lib
vim.pack.add { 'https://github.com/saghen/blink.lib' }

-- completion
vim.pack.add { 'https://github.com/saghen/blink.cmp' }

local cmp = require 'blink.cmp'

cmp.build():pwait()
cmp.setup {
  appearance = { nerd_font_variant = 'normal' },
  completion = {
    documentation = { auto_show = true, window = { border = 'rounded' } },
    menu = { auto_show = true, border = 'rounded' },
    ghost_text = { enabled = true },
    list = { selection = { preselect = false, auto_insert = false } },
  },
  fuzzy = { implementation = 'prefer_rust_with_warning' },
  signature = { enabled = true, window = { border = 'rounded' } },
  keymap = {
    preset = 'none',
    ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
    ['<CR>'] = { 'accept', 'fallback' },
    ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
    ['<Up>'] = { 'select_prev', 'fallback' },
    ['<Down>'] = { 'select_next', 'fallback' },
  },
  cmdline = {
    enabled = true,
    keymap = {
      ['<Tab>'] = { 'show_and_insert_or_accept_single', 'accept', 'fallback' },
      ['<Up>'] = { 'select_prev', 'fallback' },
      ['<Down>'] = { 'select_next', 'fallback' },
      ['<Right>'] = { 'accept', 'fallback' },
      ['<C-space>'] = { 'show', 'fallback' },
      ['<C-c>'] = { 'cancel', 'fallback' },
      ['<CR>'] = { 'select_accept_and_enter', 'fallback' },
    },
    completion = {
      menu = {
        auto_show = function(ctx) return vim.fn.getcmdtype() == ':' end,
      },
      ghost_text = {
        enabled = true,
      },
    },
  },
  sources = {
    default = { 'lsp', 'path', 'buffer' },
    providers = {
      cmdline = {
        min_keyword_length = function(ctx)
          if ctx.mode == 'cmdline' and string.find(ctx.line, ' ') == nil then return 3 end
          return 0
        end,
      },
    },
  },
  term = { enabled = false },
}

-- pairs
vim.pack.add { { src = 'https://github.com/saghen/blink.pairs', version = vim.version.range '*' } }

local pairs = require 'blink.pairs'

pairs.build():pwait(60000)
pairs.setup {}
