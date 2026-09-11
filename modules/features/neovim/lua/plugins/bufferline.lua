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
    custom_filter = function(buf_number)
      local name = vim.api.nvim_buf_get_name(buf_number)
      if name == '' then return false end
      return true
    end,
  },
}
