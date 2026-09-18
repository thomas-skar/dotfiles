vim.pack.add { 'https://github.com/folke/todo-comments.nvim' }

require('todo-comments').setup {
  signs = true,
  highlight = {
    multiline = true,
    comments_only = true,
  },
  keywords = {
    DOCS = { icon = ' ', color = 'hint' },
  },
}
