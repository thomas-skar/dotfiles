-- enable inlay hints
do
  -- TODO: go filetype filter ?
  if not vim.lsp.inlay_hint.is_enabled() then vim.lsp.inlay_hint.enable(true) end
end
