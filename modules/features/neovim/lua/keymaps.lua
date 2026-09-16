-- TODO: move with ctrl + arrow keys
-- TODO: duplicate lines with ???
-- TODO: toggle comments with Ctrl-K --> Ctrl-C
-- TODO: toggle block comments with Ctrl-K --> Ctrl-B ?
-- TODO: close floating windows with <Esc> (:fc) ???
-- TODO: move lines with <Alt-Up> and <Alt-Down> in visual mode

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
vim.keymap.set('n', '<Esc>', '<CMD>nohlsearch<CR>')

-- save buffer with <Ctrl-S>
vim.keymap.set({ 'n', 'i', 'v' }, '<C-s>', '<CMD>update | redraw<CR>')

-- select line with <Ctrl-L>
vim.keymap.set('n', '<C-l>', 'V')

-- select line with <Ctrl-L> in insert mode
vim.keymap.set('i', '<C-l>', '<Esc>V')

-- copy with <Ctrl-C>
vim.keymap.set('v', '<C-c>', 'y')

-- cut with <Ctrl-X>
vim.keymap.set('v', '<C-x>', 'x')

-- paste with <Ctrl-v>
vim.keymap.set('n', '<C-v>', 'p')

-- paste with <Ctrl-v> in insert mode
vim.keymap.set('i', '<C-v>', '<C-O>p')

-- undo with <Ctrl-Z>
vim.keymap.set({ 'n', 'i', 'v' }, '<C-z>', '<CMD>undo<CR>')

-- redo with <Shift-Ctrl-Z>
vim.keymap.set({ 'n', 'i', 'v' }, '<S-C-z>', '<CMD>redo<CR>')

-- exit terminal mode with <Esc>
-- vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]])

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

-- move lines up or down with <Alt-Up> and <Alt-Down>
vim.keymap.set('n', '<A-Up>', 'ddkP')
vim.keymap.set('n', '<A-Down>', 'ddp')

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

-- enter insert mode from visual mode with i
vim.keymap.set('v', 'i', '<Esc>i')

-- split window with <Ctrl-Super-Right> and <Ctrl-Super-Down>
vim.keymap.set('n', '<C-D-Right>', '<CMD>vsplit<CR>')
vim.keymap.set('n', '<C-D-Down>', '<CMD>split<CR>')

-- search for word under cursor with / in visual mode
vim.keymap.set('v', '/', '*N')

-- TODO: search for word under cursor with / in normal mode (but allow normal search)

----------------------------------------------------------------------------------------------------

-- source neovim config with <Space> -> so
vim.keymap.set('n', '<leader>so', '<CMD>source $MYVIMRC<CR>')

-- restart neovim with <Space> -> re
vim.keymap.set('n', '<leader>re', '<CMD>restart!<CR>')
