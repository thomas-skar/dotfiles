vim.pack.add { { src = 'https://github.com/neovim/nvim-lspconfig', name = 'lspconfig' } }

local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok, cmp = pcall(require, 'blink.cmp')
if ok then capabilities = vim.tbl_deep_extend('force', capabilities, cmp.get_lsp_capabilities({}, false)) end

vim.lsp.config('*', { capabilities = capabilities })

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
}

vim.lsp.inlay_hint.enable(true)
