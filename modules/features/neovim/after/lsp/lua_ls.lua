-- lua_ls settings
return {
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
}
