---@type vim.lsp.Config
local config = {
  cmd = { 'vscode-json-language-server', '--stdio' },

  ---@type lspconfig.settings.jsonls
  settings = {
    json = {
      schemas = {}, -- TODO: schemas !
    },
  },
}

return config
