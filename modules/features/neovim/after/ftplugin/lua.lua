vim.pack.add { 'https://github.com/folke/lazydev.nvim' }

---@type lazydev.Config
local opts = {
  library = {
    { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
    { path = 'snacks.nvim', words = { 'Snacks' } },
  },
  integrations = {
    lspconfig = true,
    cmp = true,
  },
}

require('lazydev').setup(opts)
