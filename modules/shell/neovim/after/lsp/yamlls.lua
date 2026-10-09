---@type vim.lsp.Config
local config = {
  cmd = { 'yaml-language-server', '--stdio' },
  ---@type lspconfig.settings.yamlls
  settings = {
    redhat = {
      telemetry = {
        enabled = false,
      },
    },
    yaml = {
      yamlVersion = '1.2',
      format = {
        enable = true,
        singleQuote = false,
        bracketSpacing = true,
        trailingComma = true,
      },
      validate = true,
      hover = true,
      hoverAnchor = true,
      hoverSchemaSource = true,
      completion = true,
      schemas = {
        kubernetes = {
          'manifests/**/*.yaml',
          'manifests/**/*.yml',
          'k8s/**/*.yaml',
          'k8s/**/*.yml',
        },
      }, -- TODO: !
      schemaStore = {
        enable = true,
      },
      kubernetesCRDStore = {
        enable = true,
      },
    },
    editor = {
      tabSize = 2,
      formatOnType = true,
    },
  },
}

return config
