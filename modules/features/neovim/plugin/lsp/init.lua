-- TODO: move lsp stuff to plugin directory (subfolder) OR ftplugin directory?

vim.pack.add { { src = 'https://github.com/neovim/nvim-lspconfig', name = 'lspconfig' } }

local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok, cmp = pcall(require, 'blink.cmp')
if ok then capabilities = vim.tbl_deep_extend('force', capabilities, cmp.get_lsp_capabilities({}, false)) end

---@type vim.lsp.Config
local config = {
  capabilities = capabilities,
}

vim.lsp.config('*', config)

-- TODO: figure out why this is necessary
vim.lsp.inlay_hint.enable(true)

------------------------------------------------------------------------------------
-- TODO:
--  sql
--  fish?
--  helm?
--  markdown
--  terraform?
--  bash?
--  make?

-- require 'css'
-- require 'docker'
-- require 'go'
-- require 'graphql'
-- require 'html'
-- require 'json'
-- require 'just'
-- require 'lua'
-- require 'nix'
-- require 'python'
-- require 'toml'
-- require 'typescript'
-- require 'yaml'

-- require 'lsp.copilot'
