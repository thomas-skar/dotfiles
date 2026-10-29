local settings = {
  hover = true,
  completion = true,
  validation = true,
}

---@type vim.lsp.Config
local config = {
  cmd = { 'yaml-schema-router' },
  filetypes = { 'yaml', 'yml' },
  root_markers = { '.git' },
  settings = {
    yaml = settings,
    config = {
      yaml = settings,
    },
  },
  config = {
    yaml = settings,
  },
}

return config
