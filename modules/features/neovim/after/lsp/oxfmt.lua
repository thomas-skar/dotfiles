---@type vim.lsp.Config
local config = {
  cmd = { 'oxfmt', '--stdio' },
  root_markers = { '.git' },
}

return config
