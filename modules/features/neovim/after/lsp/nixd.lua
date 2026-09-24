return {
  ---@type lspconfig.settings.nixd
  settings = {
    nixd = {
      formatting = { command = { 'nixfmt' } },
    },
  },
}
