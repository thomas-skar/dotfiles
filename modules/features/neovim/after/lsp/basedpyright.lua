-- basedpyright settings
return {
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
