vim.pack.add {
  { src = 'https://github.com/OXY2DEV/markview.nvim' },
}

-- TODO: mermaid
-- TODO: move setup to after/ftplugin?

Config.later(function()
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
end)
