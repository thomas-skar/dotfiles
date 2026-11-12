Config.new_autocmd('TextYankPost', '*', vim.highlight.on_yank, 'Highlight yanked text')

Config.new_autocmd('BufRead', 'Tiltfile', function() vim.bo.filetype = 'starlark' end, 'File tiltile filetype')

Config.new_autocmd('User', 'MiniStarterOpened', function()
  vim.keymap.set('n', '<CR>', function()
    Config.now(function()
      require('mini.map').open()
      require('mini.starter').eval_current_item()
    end)
  end, { buffer = true })
end, 'Auto start mini.map')
