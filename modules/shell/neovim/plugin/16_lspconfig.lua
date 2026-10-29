-- TODO: kdl lsp
-- TODO: fix yamlls setup

vim.pack.add {
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = 'https://github.com/folke/lazydev.nvim' },
  { src = 'https://github.com/mosheavni/yaml-companion.nvim' },
  { src = 'https://github.com/nvim-lua/plenary.nvim' },
  { src = 'https://github.com/cenk1cenk2/schema-companion.nvim' },
  -- { src = 'https://github.com/cwrau/yaml-schema-detect.nvim' },
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok, cmp = pcall(require, 'blink.cmp')
if ok then capabilities = vim.tbl_deep_extend('force', capabilities, cmp.get_lsp_capabilities({}, false)) end

vim.lsp.config('*', { capabilities = capabilities })

-- yaml (companion) >:|
local yaml_cfg = require('yaml-companion').setup {
  builtin_matchers = {
    kubernetes = { enabled = true },
  },
  schemas = {},
  cluster_crds = {
    enabled = true,
    fallback = true,
    -- lspconfig = {},
  },
}
vim.lsp.config('yamlls', yaml_cfg)

-- schema companion (more in after/lsp/yamlls.lua)
require('schema-companion').setup {}

vim.lsp.enable {
  'gopls',
  'golangci_lint_ls',
  'html',
  'jsonls',
  'just',
  'lua_ls',
  'stylua',
  'nil_ls',
  'nixd',
  'ruff',
  'ty',
  'basedpyright',
  'taplo',
  'tombi',
  'tsc',
  'ts_ls',
  'oxlint',
  'oxfmt',
  'docker_language_server',
  'yamlls',
  'cssls',
  'graphql',
  'tailwindcss',
  'jsonnet_ls',
  'marksman',
  'fish_lsp',
  'bashls',
  'tilt_ls',
  -- 'yaml-schema-router',
}

vim.lsp.inlay_hint.enable(true)
