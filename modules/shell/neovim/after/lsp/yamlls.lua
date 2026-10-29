local ok, companion = pcall(require, 'schema-companion')
if ok then
  return companion.setup_client(companion.adapters.yamlls.setup {
    sources = {
      companion.sources.matchers.kubernetes.setup {},
      companion.sources.lsp.setup(),
      companion.sources.schemas.setup {},
    },
  })
end

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
          'manifests/**/*.{yml,yaml}',
          'clusters/**/*.{yml,yaml}',
          'apps/**/*.{yml,yaml}',
          'k8s/**/*.{yml,yaml}',
        },
        ['https://www.schemastore.org/kustomization'] = 'kustomization.yaml',
      },
      schemaStore = {
        enable = true,
      },
      kubernetesCRDStore = {
        enable = true,
        -- url = '', -- TODO:
      },
    },
    editor = {
      tabSize = 2,
      formatOnType = true,
    },
  },
}

return config
