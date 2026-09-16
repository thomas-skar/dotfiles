-- TODO: render mermaid ?

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
