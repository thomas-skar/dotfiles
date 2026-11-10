---@type lazydev.Config
local opts = {
  library = {
    { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
  },
  integrations = {
    lspconfig = true,
    cmp = true,
  },
}

require('lazydev').setup(opts)
