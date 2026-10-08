---@type vim.lsp.Config
local config = {
  cmd = { 'yaml-language-server', '--stdio' },
  ---@type lspconfig.settings.yamlls
  settings = {
    redhat = { telemetry = { enabled = false } },
    yaml = { format = { enable = true } },
  },
}

return config
