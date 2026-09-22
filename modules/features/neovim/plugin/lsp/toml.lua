-- taplo
vim.lsp.config('taplo', {
  cmd = { 'taplo', 'lsp', 'stdio' },
  filetypes = { 'toml' },
  root_markers = { '.taplo.toml', 'taplo.toml', '.git' },
})

vim.lsp.enable 'taplo'

-- tombi
vim.lsp.config('tombi', {})
vim.lsp.enable 'tombi'
