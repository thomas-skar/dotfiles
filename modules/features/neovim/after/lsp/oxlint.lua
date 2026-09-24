---@type vim.lsp.Config
local config = {
  cmd = { 'oxlint', '--stdio' },
  root_markers = { 'package.json' },
}

return config
