---@type vim.lsp.Config
local config = {
  init_options = {
    rules = {
      ['unresolved-alias-target'] = { level = 'info' },
    },
  },
}

return config
