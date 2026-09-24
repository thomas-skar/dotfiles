vim.pack.add { 'https://github.com/nvim-lualine/lualine.nvim' }

if Config.statusline == 'lualine' then
  require('lualine').setup {
    options = {
      icons_enabled = true,
      theme = 'monokai-v2',
      component_separators = '',
      section_separators = '',
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'lsp_status' },
        lualine_y = { 'encoding', 'fileformat', 'filetype' },
        lualine_z = { 'location' },
      },
    },
  }
end
