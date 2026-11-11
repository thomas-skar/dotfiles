vim.pack.add {
  { src = 'https://github.com/lewis6991/gitsigns.nvim' },
}

Config.later(
  function()
    require('gitsigns').setup {
      auto_attach = true,
      attach_to_untracked = false,
      current_line_blame = false,
      signcolumn = true,
    }
  end
)
