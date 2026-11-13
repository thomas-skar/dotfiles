local autocmd, map, now = Config.new_autocmd, Config.map, Config.now

autocmd('TextYankPost', '*', vim.highlight.on_yank, 'Highlight yanked text')

autocmd('BufRead', 'Tiltfile', function() vim.bo.filetype = 'starlark' end, 'File tiltile filetype')

autocmd('User', 'MiniStarterOpened', function()
  map('n', '<CR>', function()
    now(function()
      require('mini.starter').eval_current_item()
      require('mini.map').open()
    end)
  end, 'Override <CR> to also open mini.map', { buffer = true })
end, 'Auto start mini.map')
