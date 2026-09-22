-- ruff
vim.lsp.config('ruff', {
  cmd = { 'ruff', 'server' },
  filetypes = { 'python' },
  root_markers = { 'pyproject.toml', 'ruff.toml', '.ruff.toml', '.git' },
  settings = {},
})

vim.lsp.enable 'ruff'

-- ty
vim.lsp.config('ty', {
  cmd = { 'ty', 'server' },
  filetypes = { 'python' },
  root_markers = { 'ty.toml', 'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', '.git' },
  settings = {},
})

vim.lsp.enable 'ty'

-- basedpyright
vim.lsp.config('basedpyright', {
  cmd = { 'basedpyright-langserver', '--stdio' },
  filetypes = { 'python' },
  root_markers = { 'pyproject.toml', 'pyrightconfig.json', 'setup.py', 'setup.cfg', 'requirements.txt', '.git' },
  settings = {
    basedpyright = {
      analysis = {
        autoSearchPaths = true,
        openFilesOnly = true,
        autoImportCompletions = true,
        diagnosticMode = 'openFilesOnly',
        inlayHints = {
          variableTypes = true,
          callArgumentTypes = true,
          functionReturnTypes = true,
          genericTypes = true,
        },
        autoFormatStrings = true,
      },
    },
  },
  on_attach = function(_, bufnr)
    vim.api.nvim_buf_create_user_command(bufnr, 'LspPyrightSetPythonPath', function(command)
      local path = command.args
      local clients = vim.lsp.get_clients { bufnr = vim.api.nvim_get_current_buf(), name = 'basedpyright' }
      for _, client in ipairs(clients) do
        if client.settings then
          ---@diagnostic disable-next-line: param-type-mismatch
          client.settings.python = vim.tbl_deep_extend('force', client.settings.python or {}, { pythonPath = path })
        else
          client.config.settings = vim.tbl_deep_extend('force', client.config.settings, { python = { pythonPath = path } })
        end
        client:notify('workspace/didChangeConfiguration', { settings = nil })
      end
    end, { nargs = 1, complete = 'file' })
  end,
})

vim.lsp.enable 'basedpyright'
