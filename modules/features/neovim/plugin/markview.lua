-- TODO: mermaid

vim.api.nvim_create_autocmd('FileType', {
  desc = 'Setup markview plugin when opening markfown files',
  pattern = { 'markdown', 'html', 'yaml' },
  once = true,
  callback = function()
    vim.pack.add { 'https://github.com/OXY2DEV/markview.nvim' }

    require('markview').setup {
      preview = {
        enable = true,
        icon_provider = 'mini',
      },
      markdown = {
        enable = true,
      },
      markdown_inline = {
        enable = true,
      },
      html = {
        enable = true,
      },
      yaml = {
        enable = true,
      },
    }
  end,
})
