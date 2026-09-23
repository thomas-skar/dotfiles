vim.pack.add {
  'https://github.com/zbirenbaum/copilot.lua',
  'https://github.com/copilotlsp-nvim/copilot-lsp',
}

require('copilot').setup {
  panel = {
    enabled = false,
  },
  suggestion = {
    enabled = true,
    auto_trigger = true,
    hide_during_completion = true,
    trigger_on_accept = true,
    keymap = {
      accept = '<Tab>',
      dismiss = '<Esc>',
    },
  },
  nes = {
    enabled = false,
  },
  server = {
    type = 'binary',
  },
}

------------------------------------------------------------------------------------

-- DOCS: https://main.cmp.saghen.dev/recipes.html#hide-copilot-on-suggestion
vim.api.nvim_create_autocmd('User', {
  pattern = 'BlinkCmpMenuOpen',
  callback = function() vim.b.copilot_suggestion_hidden = true end,
})

vim.api.nvim_create_autocmd('User', {
  pattern = 'BlinkCmpMenuClose',
  callback = function() vim.b.copilot_suggestion_hidden = false end,
})
