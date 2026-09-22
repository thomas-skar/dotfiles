-- TODO: move with ctrl + arrow keys
-- TODO: duplicate lines with Shift-Alt-Up and Shift-Alt-Down ???
-- TODO: toggle comments with Ctrl-K --> Ctrl-C (or leader kc)
-- TODO: toggle block comments with Ctrl-K --> Ctrl-B ? (or leader kb)
-- TODO: keymap :w in insert mode ?!?!?!?
-- TODO: select word --> next occurence with <Ctrl-D>
-- TODO: go to definition
-- TODO: toggle floating windows (lsp, diag, etc) with <Shift-K>?
-- TODO: save all with <Ctrl-S>

-- unbind <Ctrl-C>
vim.keymap.set('n', '<C-c>', '<nop>')

-- unbind . (???)
vim.keymap.set('n', '.', '<nop>')

----------------------------------------------------------------------------------------------------

-- override "delete line(s)" to not yank text TODO: expand this to fix quirks
vim.keymap.set({ 'n', 'v' }, 'd', '"_d')
vim.keymap.set('n', 'dd', '"_dd')

----------------------------------------------------------------------------------------------------
-- enter insert mode with <Space><Space>
vim.keymap.set('n', '<leader><space>', 'i')

-- exit insert mode with <Space> --> jk
vim.keymap.set('i', '<leader>jk', '<Esc><Esc>')

-- search with <Ctrl-F>
vim.keymap.set('n', '<C-f>', '/')

-- save buffer with <Ctrl-S>
vim.keymap.set({ 'n', 'i', 'v' }, '<C-s>', '<CMD>update | redraw<CR>')

-- select line with <Ctrl-L>
vim.keymap.set('n', '<C-l>', 'V')

-- select line with <Ctrl-L> in insert mode
vim.keymap.set('i', '<C-l>', '<Esc>V')

-- copy with <Ctrl-C>
vim.keymap.set('n', '<C-c>', 'Vy')
vim.keymap.set('v', '<C-c>', 'y')

-- cut with <Ctrl-X>
vim.keymap.set('n', '<C-x>', 'Vx')
vim.keymap.set('v', '<C-x>', 'x')

-- paste with <Ctrl-v>
vim.keymap.set('n', '<C-v>', 'p')

-- paste with <Ctrl-v> in insert mode
vim.keymap.set('i', '<C-v>', '<C-O>p')

-- undo with <Ctrl-Z>
vim.keymap.set({ 'n', 'i', 'v' }, '<C-z>', '<CMD>undo<CR>')

-- redo with <Shift-Ctrl-Z>
vim.keymap.set({ 'n', 'i', 'v' }, '<S-C-z>', '<CMD>redo<CR>')

-- enter visual mode with <Shift-Up>, <Shift-Down>, <Shift-Left>, <Shift-Right>
vim.keymap.set('n', '<S-Up>', 'v<Up>')
vim.keymap.set('n', '<S-Down>', 'v<Down>')
vim.keymap.set('n', '<S-Left>', 'v<Left>')
vim.keymap.set('n', '<S-Right>', 'v<Right>')

-- enter visual mode with <Shift-Up>, <Shift-Down>, <Shift-Left>, <Shift-Right> in insert mode
vim.keymap.set('i', '<S-Up>', '<C-O>v<Up>')
vim.keymap.set('i', '<S-Down>', '<C-O>v<Down>')
vim.keymap.set('i', '<S-Left>', '<C-O>v<Left>')
vim.keymap.set('i', '<S-Right>', '<C-O>v<Right>')

-- override <Shift-Up> and <Shift-Down> in visual mode (default: start/end of file)
vim.keymap.set('v', '<S-Up>', '<Up>')
vim.keymap.set('v', '<S-Down>', '<Down>')

-- delete words with <Ctrl-Backspace>
vim.keymap.set('i', '<C-BS>', '<C-W>')

-- delete lines with <Super-Backspace>
vim.keymap.set('i', '<D-BS>', '<C-O>d0')

-- move cursor left/right with <Alt-Left> and <Alt-Right>
vim.keymap.set({ 'n', 'v' }, '<A-Left>', 'b')
vim.keymap.set({ 'n', 'v' }, '<A-Right>', 'w')

-- move cursor left/right with <Alt-Left> and <Alt-Right> in insert mode
vim.keymap.set('i', '<A-Left>', '<C-O>b')
vim.keymap.set('i', '<A-Right>', '<C-O>w')

-- move cursor left/right with <Shift-Alt-Left> and <Shift-Alt-Right> in visual mode
vim.keymap.set('v', '<S-A-Left>', 'b')
vim.keymap.set('v', '<S-A-Right>', 'w')

-- jump to start/end of line with <Super-Left> and <Super-Right>
vim.keymap.set({ 'n', 'v' }, '<D-Left>', '_')
vim.keymap.set({ 'n', 'v' }, '<D-Right>', '$')

-- jump to start/end of line with <Super-Left> and <Super-Right> in insert mode
vim.keymap.set('i', '<D-Left>', '<C-O>_')
vim.keymap.set('i', '<D-Right>', '<C-O>$')

-- jump to start/end of line with <Shift-Super-Left> and <Shift-Super-Right> in visual mode
vim.keymap.set('v', '<S-D-Left>', '_')
vim.keymap.set('v', '<S-D-Right>', '$')

-- jump to start/end of file with <Super-Up> and <Super-Down>
vim.keymap.set('n', '<D-Up>', '<CMD>goto<CR>') -- gg
vim.keymap.set('n', '<D-Down>', 'G$')

-- split right with <Space> --> sr
vim.keymap.set('n', '<leader>sr', '<CMD>vsplit<CR>')

-- enter "visual line mode" in visual mode with L
vim.keymap.set('v', 'l', '<S-v>')
vim.keymap.set('v', '<A-Up>', ":m '<-2<cr>gv=gv")

-- enter insert mode from visual mode with i
vim.keymap.set('v', 'i', '<Esc>i')

-- split window with <Ctrl-Super-Right> and <Ctrl-Super-Down>
vim.keymap.set('n', '<C-D-Right>', '<CMD>vsplit<CR>')
vim.keymap.set('n', '<C-D-Down>', '<CMD>split<CR>')

-- TODO: normal mode, search for word under cursor with / (but allow normal search)

-- search for word under cursor with / in visual mode (TODO: not wanted behaviour)
vim.keymap.set('v', '/', '*N')

-- show lsp code actions with <Ctrl-.>
vim.keymap.set({ 'n', 'i' }, '<C-.>', '<CMD>lua vim.lsp.buf.code_action()<CR>')

-- unindent (outdent?) with <Shift-Tab> in insert mode
vim.keymap.set('i', '<S-Tab>', '<C-D>') -- or <<

-- select everything with <Ctrl-A>
vim.keymap.set({ 'n', 'v' }, '<C-a>', 'ggVG')

----------------------------------------------------------------------------------------------------

-- source neovim config with <Space> -> so
vim.keymap.set('n', '<leader>so', '<CMD>source $MYVIMRC<CR>')

-- restart neovim with <Space> -> re
vim.keymap.set('n', '<leader>re', '<CMD>restart!<CR>')

-- enable lsp inlay hints with <Space> -> ih
vim.keymap.set('n', '<leader>ih', '<CMD>lua vim.lsp.inlay_hint.enable(true)<CR>')

----------------------------------------------------------------------------------------------------

-- close floating windows, clear search highlights, etc with <Esc>
vim.keymap.set('n', '<Esc>', function()
  local done = false

  -- close popup windows
  local wins = vim.api.nvim_list_wins()
  for _, win in ipairs(wins) do
    -- don't close snacks windows (explorer)
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.bo[buf].filetype:find 'snacks' then goto continue end

    -- close floating windows
    local cfg = vim.api.nvim_win_get_config(win)
    if cfg.relative ~= '' then
      vim.api.nvim_win_close(win, true)
      done = true
    end
    ::continue::
  end

  if done then
    -- NOTE: include CursorHold in eventignore to prevent popup window from reopening immediately
    if type(vim.o.eventignore) == 'string' then
      if vim.o.eventignore == '' then
        vim.o.eventignore = 'CursorHold'
      else
        vim.o.eventignore = vim.o.eventignore .. ',CursorHold'
      end
    elseif type(vim.o.eventignore) == 'table' then
      vim.o.eventignore:append 'CursorHold'
    end

    return
  end

  -- clear search highlights
  vim.cmd 'nohlsearch'
end)
