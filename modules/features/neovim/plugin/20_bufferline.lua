vim.pack.add {
  { src = 'https://github.com/akinsho/bufferline.nvim', name = 'bufferline' },
}

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
    numbers = function(opts) return string.format('%s', opts.ordinal) end,
    pick = {
      alphabet = '1234567890',
    },
  },
}

------------------------------------------------------------------------------------

if vim.g.neovide then
  vim.keymap.set('n', '<A-1>', '<CMD>BufferLineGoToBuffer 1<CR>')
  vim.keymap.set('n', '<A-2>', '<CMD>BufferLineGoToBuffer 2<CR>')
  vim.keymap.set('n', '<A-3>', '<CMD>BufferLineGoToBuffer 3<CR>')
  vim.keymap.set('n', '<A-4>', '<CMD>BufferLineGoToBuffer 4<CR>')
  vim.keymap.set('n', '<A-5>', '<CMD>BufferLineGoToBuffer 5<CR>')
  vim.keymap.set('n', '<A-6>', '<CMD>BufferLineGoToBuffer 6<CR>')
  vim.keymap.set('n', '<A-7>', '<CMD>BufferLineGoToBuffer 7<CR>')
  vim.keymap.set('n', '<A-8>', '<CMD>BufferLineGoToBuffer 8<CR>')
  vim.keymap.set('n', '<A-9>', '<CMD>BufferLineGoToBuffer 9<CR>')
  vim.keymap.set('n', '<A-0>', '<CMD>BufferLineGoToBuffer -1<CR>')
end
