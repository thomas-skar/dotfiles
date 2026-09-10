-- TODO: keymaps to jump between "tabs"?

vim.pack.add { 'https://github.com/akinsho/bufferline.nvim' }

require('bufferline').setup {
  options = {
    mode = 'buffers',
    offsets = {
      {
        filetype = 'snacks_layout_box',
        text = '',
        separator = true,
      },
    },
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    separator_style = 'thin',
    always_show_bufferline = true,
    diagnostics = 'nvim_lsp',
    show_duplicate_prefix = true,
    hover = {
      enabled = true,
    },
  },
}
