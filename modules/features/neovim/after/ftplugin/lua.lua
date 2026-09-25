local ok, lazydev = pcall(require, 'lazydev')

if ok then
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

  lazydev.setup(opts)
end
