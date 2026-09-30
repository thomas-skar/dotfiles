vim.pack.add {
  { src = 'https://github.com/stevearc/conform.nvim' },
}

require('conform').setup {
  formatters_by_ft = {
    lua = { 'stylua' },
    go = { 'gofmt', 'goimports', 'golangci-lint' },
    nix = { 'nixfmt', 'alejandra', stop_after_first = true },
    json = { 'oxfmt', 'jq' },
    python = { 'ruff_format', 'ruff_organize_imports' },
    xml = { 'xmlstarlet' },
    just = { 'just' },
    toml = { 'taplo', 'tombi' },
    yaml = {},
    javascript = { 'oxfmt' },
    typescript = { 'oxfmt', 'oxlint' },
    fish = { 'fish_indent' },
    sh = { 'shfmt' },
    kdl = { 'kdlfmt' },
    ['*'] = { 'codespell' },
    ['_'] = {},
  },
  default_format_opts = {
    lsp_format = 'fallback',
  },
  format_on_save = {
    lsp_format = 'fallback',
  },
  format_after_save = {
    lsp_format = 'fallback',
  },
  notify_on_error = true,
  notify_no_formatters = true,
}
