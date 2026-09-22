-- gopls
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
        unreachable = true,
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
      fileWatcher = 'fsnotify',
      symbolScope = 'all',
      symbolMatcher = 'FastFuzzy',
      linksInHover = 'gopls',
      hoverKind = 'FullDocumentation',
      diagnosticsTrigger = 'Edit',
      vulncheck = 'Imports',
      completeFunctionCalls = true,
      matcher = 'Fuzzy',
      newGoFileHeader = true,
    },
  },
})

vim.lsp.enable 'gopls'

-- golangci-lint
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

vim.lsp.enable 'golangci_lint_ls'
