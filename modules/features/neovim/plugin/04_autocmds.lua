local group = vim.api.nvim_create_augroup('custom', {})

-- highlight text when copying
vim.api.nvim_create_autocmd('TextYankPost', {
  group = group,
  callback = function() vim.highlight.on_yank() end,
})

-- stop the autocomplete popup menu from appearing inside "telescope"
vim.api.nvim_create_autocmd('BufEnter', {
  group = group,
  callback = function(ev)
    if vim.bo[ev.buf].buftype ~= '' then vim.bo[ev.buf].autocomplete = false end
  end,
})

-- DOCS: https://main.cmp.saghen.dev/recipes.html#hide-copilot-on-suggestion
vim.api.nvim_create_autocmd('User', {
  group = group,
  pattern = 'BlinkCmpMenuOpen',
  callback = function() vim.b.copilot_suggestion_hidden = true end,
})

vim.api.nvim_create_autocmd('User', {
  group = group,
  pattern = 'BlinkCmpMenuClose',
  callback = function() vim.b.copilot_suggestion_hidden = false end,
})
