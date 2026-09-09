vim.pack.add { 'https://github.com/stevearc/conform.nvim' }

require('conform').setup {
  formatters_by_ft = {
    lua = { 'stylua' },
    go = { 'gofmt', 'goimports' },
  },
  default_format_opts = { lsp_format = 'fallback' },
}
