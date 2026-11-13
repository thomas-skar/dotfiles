local now, map, autocmd = Config.now, Config.map, Config.new_autocmd
local tree = Config.tree

now(function()
  if tree ~= 'netrw' then
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    return
  end

  -- TODO: add https://github.com/prichrd/netrw.nvim

  vim.g.netrw_banner = 0
  vim.g.netrw_winsize = 15
  vim.g.netrw_liststyle = 3
  vim.g.netrw_browse_split = 4
  vim.g.netrw_keepdir = 0
  vim.g.netrw_altv = 1
  vim.g.netrw_chgwin = 1
  vim.g.netrw_fastbrowse = 2

  -- TODO: <C-e> map to focus netrw
  map('n', '<C-S-e>', ':Lexplore<CR>', 'Toggle netrw', { silent = true })

  -- FIX: doesn't work
  autocmd('BufEnter', '*', function()
    if vim.bo.filetype ~= '' or vim.bo.filetype == 'netrw' then return end

    local netrw_win = nil
    for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
      local buf = vim.api.nvim_win_get_buf(win)
      if vim.bo[buf].filetype == 'netrw' then
        netrw_win = win
        break
      end
    end

    if netrw_win then
      local file = vim.fn.expand '%:t'
      local dir = vim.fn.expand '%:p:h'
      vim.api.nvim_win_call(netrw_win, function()
        vim.cmd('silent Explore ' .. vim.fn.fnameescape(dir))
        if file ~= '' then vim.fn.search('\\V' .. vim.fn.escape(file, '\\')) end
      end)
    end
  end, 'Make netrw follow the current file')
end)
