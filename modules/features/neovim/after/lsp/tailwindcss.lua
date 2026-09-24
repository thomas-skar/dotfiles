---@type vim.lsp.Config
local config = {
  cmd = { 'tailwindcss-language-server', '--stdio' },

  ---@type lspconfig.settings.tailwindcss
  settings = {},
}

return config
