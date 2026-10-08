return {
  ---@type lspconfig.settings.gopls
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
}
