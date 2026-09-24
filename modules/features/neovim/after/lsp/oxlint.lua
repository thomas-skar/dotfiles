---@type vim.lsp.Config
local config = {
  cmd = { 'oxlint', '--lsp' },
  root_markers = { 'package.json' },
}

return config
