vim.api.nvim_create_user_command('UpdatePlugins', function() vim.pack.update() end, { desc = 'Update plugins' })

vim.api.nvim_create_user_command('InlayHints', function(args)
  local enable = true
  if args.fargs[1] == 'disable' | 'false' | 'off' then enable = false end
  vim.lsp.inlay_hint.enable(enable)
end, { desc = 'Enable LSP inlay hints' })
