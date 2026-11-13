local command = Config.new_command

command('UpdatePlugins', function() vim.pack.update() end, 'Update plugins')

command('InlayHints', function(args)
  local enable = true
  if args.fargs[1] == 'disable' | 'false' | 'off' then enable = false end
  vim.lsp.inlay_hint.enable(enable)
end, 'Enable LSP inlay hints')
