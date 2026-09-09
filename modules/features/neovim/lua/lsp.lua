-- diagnostics
vim.diagnostic.config {
  severity_sort = true,
  update_in_insert = false,
  float = {
    border = 'rounded',
    source = 'if_many',
  },
  underline = true,
}

-- lsp config
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- TODO: check if blink is installed
-- capabilities = vim.tbl_deep_extend('force', capabilities, require('blink.cmp').get_lsp_compatibilities({}, false))

vim.lsp.config('*', {
  capabilities = capabilities,
})

vim.lsp.config('lua_ls', {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  settings = {
    Lua = {
      codeLens = { enable = true },
      hint = { enable = true, semicolon = 'Disable' },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
        },
      },
      telemetry = {
        enable = false,
      },
    },
  },
})

vim.lsp.config('stylua', {
  cmd = { 'stylua', '--lsp' },
  filetypes = { 'lua' },
  root_markers = { '.stylua.toml', 'stylua.toml', '.editorconfig' },
})

vim.lsp.config('gopls', {
  cmd = { 'gopls' },
  filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
  settings = {
    gopls = {
      semanticTokens = true,
      staticcheck = true,
      gofumpt = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
        shadow = true,
      },
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
    },
  },
})

vim.lsp.config('golangci_lint_ls', {
  cmd = { 'golangci-lint-langserver' },
  filetypes = { 'go', 'gomod' },
  init_options = {
    command = {
      'golangci-lint',
      'run',
      '--output.text.path=',
      '--output.tab.path=',
      '--output.html.path=',
      '--output.checkstyle.path=',
      '--output.junit-xml.path=',
      '--output.teamcity.path=',
      '--output.sarif.path=',
      '--show-stats=false',
      '--output.json.path=stdout',
    },
  },
  root_markers = {
    '.golangci.yml',
    '.golangci.yaml',
    '.golangci.toml',
    '.golangci.json',
    'go.work',
    'go.mod',
    '.git',
  },
})

vim.lsp.config('nil', {
  cmd = { 'nil' },
  filetypes = { 'nix' },
  root_markers = { 'flake.nix', '.git' },
})

vim.lsp.config('nixd', {
  cmd = { 'nixd' },
  filetypes = { 'nix' },
  root_markers = { 'flake.nix', '.git' },
  settings = {
    nixd = {
      -- nixpkgs = { expr = 'import (builtins.getFlake ./.).inputs.nixpkgs { }' },
      formatting = { command = { 'nixfmt' } },
    },
  },
})

vim.lsp.config('taplo', {
  cmd = { 'taplo', 'lsp', 'stdio' },
  filetypes = { 'toml' },
  root_markers = { '.taplo.toml', 'taplo.toml', '.git' },
})

vim.lsp.config('ruff', {
  cmd = { 'ruff', 'server' },
  filetypes = { 'python' },
  root_markers = { 'pyproject.toml', 'ruff.toml', '.ruff.toml', '.git' },
  settings = {},
})

vim.lsp.config('ty', {
  cmd = { 'ty', 'server' },
  filetypes = { 'python' },
  root_markers = { 'ty.toml', 'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', '.git' },
  settings = {},
})

-- TODO: copilot ls
-- TODO: docker ls
-- TODO: graphql ls ???
-- TODO: oxfmt, oxlint
-- TODO: tailwindcss
-- TODO: sql ???
-- TODO: typescript/ tsc
-- TODO: yaml-language-server
-- TODO: json language server ???

vim.lsp.enable { 'lua_ls', 'gopls', 'nixd', 'golangci_lint_ls', 'stylua', 'ruff', 'taplo', 'ty' }
