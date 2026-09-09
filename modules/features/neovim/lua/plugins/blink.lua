-- lib
vim.pack.add { 'https://github.com/saghen/blink.lib' }

-- completion
vim.pack.add { 'https://github.com/saghen/blink.cmp' }

local cmp = require 'blink.cmp'

cmp.build():pwait()
cmp.setup {
  cmdline = { enabled = true },
  appearance = { nerd_font_variant = 'normal' },
  completion = {
    documentation = { auto_show = true },
    menu = { auto_show = true },
    ghost_text = { enabled = true },
  },
  sources = { default = { 'lsp', 'path', 'buffer' } },
  fuzzy = { implementation = 'prefer_rust_with_warning' },
  signature = { enabled = true },
}

-- pairs
vim.pack.add { { src = 'https://github.com/saghen/blink.pairs', version = vim.version.range '*' } }

local pairs = require 'blink.pairs'

pairs.build():pwait(60000)
pairs.setup {}
