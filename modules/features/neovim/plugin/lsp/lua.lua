-- lua language server
vim.lsp.config('lua_ls', {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  settings = {
    Lua = {
      codeLens = { enable = true },
      hint = { enable = true, semicolon = 'Disable' },
      diagnostics = {
        globals = { 'vim', 'Snacks' },
      },
      workspace = {
        checkThirdParty = false,
        library = vim.tbl_extend('keep', { { path = 'snacks.nvim', words = { 'Snacks' } } }, vim.api.nvim_get_runtime_file('', true)),
      },
      telemetry = {
        enable = false,
      },
    },
  },
})

vim.lsp.enable 'lua_ls'

-- stylua
vim.lsp.config('stylua', {
  cmd = { 'stylua', '--lsp' },
  filetypes = { 'lua' },
  root_markers = { '.stylua.toml', 'stylua.toml', '.editorconfig' },
})

vim.lsp.enable 'stylua'
