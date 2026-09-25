vim.pack.add {
  { src = 'https://github.com/folke/todo-comments.nvim', name = 'todo-comments' },
}

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
