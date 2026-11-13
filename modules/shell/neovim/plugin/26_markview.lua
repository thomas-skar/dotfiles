local later, add, autocmd = Config.later, Config.add, Config.new_autocmd

-- TODO: mermaid
-- TODO: move setup to after/ftplugin?

later(function()
  add { { src = 'https://github.com/OXY2DEV/markview.nvim' } }

  autocmd(
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
