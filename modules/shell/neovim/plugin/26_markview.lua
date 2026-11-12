-- TODO: mermaid
-- TODO: move setup to after/ftplugin?

Config.later(function()
  Config.add { { src = 'https://github.com/OXY2DEV/markview.nvim' } }

  Config.new_autocmd(
    'FileType',
    { 'markdown', 'html', 'yaml' },
    function()
      require('markview').setup {
        preview = {
          enable = true,
          icon_provider = 'mini',
        },
      }
    end,
    'Setup markview plugin when opening markdown files'
  )
end)
