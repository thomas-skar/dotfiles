vim.pack.add { 'https://github.com/stevearc/conform.nvim' }

require('conform').setup {
  formatters_by_ft = {
    lua = { 'stylua' },
    go = { 'gofmt', 'goimports' },
    nix = { 'nixfmt' },
    json = { 'jq' },
    python = { 'ruff' },
  },
  default_format_opts = { lsp_format = 'fallback' },
  format_on_save = { lsp_format = 'fallback' },
  format_after_save = { lsp_format = 'fallback' },
  notify_on_error = true,
  notify_no_formatters = true,
}
