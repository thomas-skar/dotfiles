vim.pack.add { 'https://github.com/lewis6991/hover.nvim' }

if vim.g.enable_hover then
  require('hover').setup {
    providers = {
      'hover.providers.diagnostic',
      'hover.providers.lsp',
      'hover.providers.dap',
      'hover.providers.man',
      -- 'hover.providers.dictionary',
      'hover.providers.fold_preview',
    },
    preview_opts = {
      border = 'rounded',
    },
    title = true,
  }

  ------------------------------------------------------------------------------------

  vim.keymap.set('n', '<MouseMove>', function() require('hover').mouse() end)

  vim.api.nvim_create_autocmd('CursorHold', {
    callback = function() require('hover').open() end,
  })
end
