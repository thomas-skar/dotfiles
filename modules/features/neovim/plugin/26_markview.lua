-- TODO: mermaid
-- TODO: move setup to after/ftplugin?

vim.pack.add {
  { src = 'https://github.com/OXY2DEV/markview.nvim', name = 'markview' },
}

vim.api.nvim_create_autocmd('FileType', {
  desc = 'Setup markview plugin when opening markdown files',
  pattern = { 'markdown', 'html', 'yaml' },
  once = true,
  callback = function()
    require('markview').setup {
      preview = {
        enable = true,
        icon_provider = 'mini',
      },
    }
  end,
})
