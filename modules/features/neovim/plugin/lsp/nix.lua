-- nil
vim.lsp.config('nil_ls', {
  cmd = { 'nil' },
  filetypes = { 'nix' },
  root_markers = { 'flake.nix', '.git' },
})

vim.lsp.enable 'nil_ls'

-- nixd
vim.lsp.config('nixd', {
  cmd = { 'nixd' },
  filetypes = { 'nix' },
  root_markers = { 'flake.nix', '.git' },
  settings = {
    nixd = {
      -- nixpkgs = { expr = 'import (builtins.getFlake ./.).inputs.nixpkgs { }' },
      formatting = { command = { 'nixfmt' } },
    },
  },
})

vim.lsp.enable 'nixd'
