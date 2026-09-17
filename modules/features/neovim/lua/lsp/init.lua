-- diagnostics
vim.diagnostic.config {
  severity_sort = true,
  update_in_insert = false,
  float = {
    border = 'rounded',
    source = 'if_many',
  },
  underline = true,
}

------------------------------------------------------------------------------------

vim.pack.add { 'https://github.com/neovim/nvim-lspconfig' }

local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok, cmp = pcall(require, 'blink.cmp')
if ok then capabilities = vim.tbl_deep_extend('force', capabilities, cmp.get_lsp_capabilities({}, false)) end

vim.lsp.config('*', {
  capabilities = capabilities,
})

------------------------------------------------------------------------------------
-- TODO:
--  sql
--  fish?
--  helm?
--  markdown
--  terraform?
--  bash?
--  make?

require 'lsp.copilot'
require 'lsp.css'
require 'lsp.docker'
require 'lsp.go'
require 'lsp.graphql'
require 'lsp.html'
require 'lsp.json'
require 'lsp.just'
require 'lsp.lua'
require 'lsp.nix'
require 'lsp.python'
require 'lsp.toml'
require 'lsp.typescript'
require 'lsp.yaml'
