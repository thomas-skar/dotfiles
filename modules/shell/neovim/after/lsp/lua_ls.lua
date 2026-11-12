return {
  ---@type lspconfig.settings.lua_ls
  settings = {
    Lua = {
      codeLens = { enable = true },
      hint = { enable = true, semicolon = 'Disable' },
      diagnostics = {
        globals = { 'vim' },
      },
      runtime = {
        version = 'LuaJIT',
        path = vim.split(package.path, ';'),
      },
      workspace = {
        checkThirdParty = false,
        ignoreSubmodules = true,
        library = { vim.env.RUNTIME },
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
