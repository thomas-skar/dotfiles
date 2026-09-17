-- yaml language server
vim.lsp.config('yaml-language-server', {
  settings = {
    redhat = { telemetry = { enabled = false } },
    yaml = { format = { enable = true } },
  },
})

vim.lsp.enable 'yaml-language-server'
