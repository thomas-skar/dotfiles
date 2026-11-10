if Config.tree == 'neo-tree' then
  vim.pack.add {
    { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = vim.version.range '3' },
    { src = 'https://github.com/nvim-lua/plenary.nvim' },
    { src = 'https://github.com/MunifTanjim/nui.nvim' },
  }

  require('neo-tree').setup {}
end
