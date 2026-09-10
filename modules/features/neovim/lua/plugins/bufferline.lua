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
    separator_style = 'slant',
    always_show_bufferline = true,
    -- custom_filter = function(buf_number, buf_numbers)
    --   if vim.bo[buf_number].filetype == 'NvimTree' then return false end
    -- end,
  },
}
