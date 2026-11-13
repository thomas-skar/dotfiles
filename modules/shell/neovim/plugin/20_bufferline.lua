local now, add, map = Config.now, Config.add, Config.map
local tabline = Config.tabline

now(function()
  if tabline ~= 'bufferline' then return end

  add { { src = 'https://github.com/akinsho/bufferline.nvim' } }

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

  if vim.g.neovide then
    for i = 0, 9 do
      local buffer = i == 0 and -1 or i
      map('n', '<A-' .. i .. '>', '<CMD>BufferLineGoToBuffer ' .. buffer .. '<CR>', 'Focus buffer ' .. i)
    end
  end
end)
