-- 1. plugin sources
local plugins = {
  { src = 'https://github.com/saghen/blink.lib' },
  { src = 'https://github.com/saghen/blink.cmp' },
  { src = 'https://github.com/rafamadriz/friendly-snippets' },
}
if Config.copilot then table.insert(plugins, { src = 'https://github.com/fang2hou/blink-copilot' }) end
vim.pack.add(plugins)

-- 2. config
---@type blink.cmp.Config
local opts = {
  appearance = {
    nerd_font_variant = 'normal',
  },
  fuzzy = {
    implementation = 'prefer_rust_with_warning',
  },
  completion = {
    documentation = {
      auto_show = true,
      window = {
        border = 'rounded',
      },
    },
    menu = {
      auto_show = true,
      border = 'rounded',
      max_height = 25,
    },
    ghost_text = {
      enabled = true,
      show_without_selection = true,
    },
    list = {
      selection = {
        preselect = true,
        auto_insert = false,
      },
      cycle = {
        from_bottom = true,
        from_top = true,
      },
    },
  },
  signature = {
    enabled = false, -- TODO: ?
    window = {
      border = 'rounded',
    },
  },
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
        auto_show = function() return vim.fn.getcmdtype() == ':' end,
      },
      ghost_text = {
        enabled = true,
      },
    },
  },
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
    per_filetype = {
      lua = { inherit_defaults = true, 'lazydev' },
    },
    providers = {
      cmdline = {
        min_keyword_length = function(ctx)
          if ctx.mode == 'cmdline' and string.find(ctx.line, ' ') == nil then return 3 end
          return 0
        end,
      },
      lazydev = {
        name = 'LazyDev',
        module = 'lazydev.integrations.blink',
        score_offset = 100,
        enabled = function() return vim.bo.filetype == 'lua' end,
      },
      snippets = {
        opts = {
          friendly_snippets = true,
        },
      },
    },
  },
  term = {
    enabled = false,
  },
}

if Config.copilot then
  opts.sources.default = { 'lsp', 'path', 'snippets', 'buffer', 'copilot' }
  opts.sources.providers.copilot = {
    name = 'copilot',
    module = 'blink-copilot',
    score_offset = 100,
    async = true,
    opts = {
      max_completions = 3,
    },
  }
end

-- 3. setup
local cmp = require 'blink.cmp'
cmp.build():pwait()
cmp.setup(opts)

-- 4. autocmds
if Config.copilot then
  vim.api.nvim_create_autocmd('User', {
    pattern = 'BlinkCmpMenuOpen',
    callback = function() vim.b.copilot_suggestion_hidden = true end,
  })

  vim.api.nvim_create_autocmd('User', {
    pattern = 'BlinkCmpMenuClose',
    callback = function() vim.b.copilot_suggestion_hidden = false end,
  })
end
