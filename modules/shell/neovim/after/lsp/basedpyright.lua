-- basedpyright settings
return {
  ---@type lspconfig.settings.basedpyright
  settings = {
    basedpyright = {
      analysis = {
        autoSearchPaths = true,
        openFilesOnly = true,
        autoImportCompletions = true,
        diagnosticMode = 'openFilesOnly',
        inlayHints = {
          variableTypes = true,
          callArgumentTypes = true,
          functionReturnTypes = true,
          genericTypes = true,
        },
        autoFormatStrings = true,
      },
    },
  },
}
