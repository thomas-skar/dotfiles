---@type vim.lsp.Config
local config = {
  cmd = { 'oxfmt', '--lsp' },
  root_markers = { '.git' },
}

return config
