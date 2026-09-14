-- TODO: move with ctrl + arrow keys
-- TODO: move with super + arrow keys
-- TODO: move with alt + arrow keys ???
-- TODO: move between buffers with ???
-- TODO: duplicate lines with ???
-- TODO: toggle block comments with Ctrl-K --> Ctrl-B ?
-- TODO: split right w/ ???

-- unbind <Ctrl-C>
vim.keymap.set('n', '<C-c>', '<nop>')

-- unbind .
vim.keymap.set('n', '.', '<nop>')

----------------------------------------------------------------------------------------------------

-- override "delete line(s)" to not yank text
vim.keymap.set({ 'n', 'v' }, 'd', '"_d')
vim.keymap.set('n', 'dd', '"_dd')

----------------------------------------------------------------------------------------------------

-- search with <Ctrl-F>
vim.keymap.set('n', '<C-f>', '/')

-- clear search highlight with <Esc>
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- close floating windows with <Esc>
-- TODO: exclude snacks explorer
-- vim.keymap.set('n', '<Esc>', '<cmd>fc<CR>')

-- enter command mode with <Shift-Ctrl-P>
vim.keymap.set('n', '<S-C-p>', ':')

-- save buffer with <Ctrl-S>
vim.keymap.set('n', '<C-s>', '<CMD>update | redraw<CR>')

-- select line with <Ctrl-L>
vim.keymap.set('n', '<C-l>', 'V')

-- copy with <Ctrl-C>
-- TODO: in normal and insert mode
vim.keymap.set('v', '<C-c>', 'y')

-- cut with <Ctrl-X>
vim.keymap.set('v', '<C-x>', 'x')

-- paste with <Ctrl-v>
vim.keymap.set('n', '<C-v>', 'p')

-- undo with <Ctrl-Z>
vim.keymap.set('n', '<C-z>', '<CMD>undo<CR>')

-- redo with <Shift-Ctrl-Z>
vim.keymap.set('n', '<S-C-z>', '<CMD>redo<CR>')

-- exit terminal mode with <Esc>
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]])

-- open terminal with <Ctrl-J>
vim.keymap.set('n', '<C-j>', '<CMD>split | terminal<CR>')

-- enter visual mode with <Shift-Up>, <Shift-Down>, <Shift-Left>, <Shift-Right>
vim.keymap.set('n', '<S-Up>', 'v<Up>')
vim.keymap.set('n', '<S-Down>', 'v<Down>')
vim.keymap.set('n', '<S-Left>', 'v<Left>')
vim.keymap.set('n', '<S-Right>', 'v<Right>')

-- override <Shift-Up> and <Shift-Down> in visual mode (default: start/end of file)
vim.keymap.set('v', '<S-Up>', '<Up>')
vim.keymap.set('v', '<S-Down>', '<Down>')

-- move lines up or down with <Alt-Up> and <Alt-Down>
vim.keymap.set('n', '<A-Down>', 'ddp') -- ddp
vim.keymap.set('n', '<A-Up>', 'ddkP') -- ddkP

-- delete words with <Ctrl-Backspace>
vim.keymap.set('i', '<C-BS>', '<C-W>')

-- delete lines with <Super-Backspace>
vim.keymap.set('i', '<D-BS>', '<C-O>d0')

-- close all buffers with <Ctrl-K> --> <Ctrl-W>
vim.keymap.set('n', '<C-k><C-w>', '<CMD>bufdo bwipeout<CR>')

-- toggle comments with <Ctrl-K> --> <Ctrl-C>
vim.keymap.set('n', '<C-k><C-c>', 'gcc')
vim.keymap.set('v', '<C-k><C-c>', 'gc')

-- jump to start/end of file with <Super-Up> and <Super-Down>
vim.keymap.set('n', '<D-Up>', '<CMD>goto<CR>') -- gg
vim.keymap.set('n', '<D-Down>', 'G$')

-- split right with <Space> --> sr
vim.keymap.set('n', '<leader>sr', '<CMD>vsplit<CR>')
----------------------------------------------------------------------------------------------------

-- open neovim config file with <Space> -> cf
vim.keymap.set('n', '<leader>cf', '<CMD>edit $MYVIMRC<CR>')

-- source neovim config with <Space> -> so
vim.keymap.set('n', '<leader>so', '<CMD>source $MYVIMRC<CR>')

-- restart neovim with <Space> -> re
vim.keymap.set('n', '<leader>re', '<CMD>restart!<CR>')
