vim.pack.add { 'https://github.com/folke/lazydev.nvim' }

require('lazydev').setup {
  runtime = vim.env.VIMRUNTIME,
  library = {
    { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
    { path = 'snacks.nvim', words = { 'Snacks' } },
  },
}
