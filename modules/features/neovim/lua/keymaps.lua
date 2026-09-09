-- search with <Ctrl-F>
vim.keymap.set('n', '<C-f>', '/')

-- clear search highlight with <Esc>
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- enter command mode with <Shift-Ctrl-P>
vim.keymap.set('n', '<S-C-p>', ':')

-- save buffer with <Ctrl-S>
vim.keymap.set('n', '<C-s>', '<CMD>silent! update | redraw<CR>')

-- close buffer with <Ctrl-W>
vim.keymap.set('n', '<C-w>', '<CMD>q<CR>')

-- toggle nvim-tree with <Ctrl-E>
vim.keymap.set('n', '<C-e>', '<cmd>NvimTreeToggle<CR>')

-- open telescope file picker with <Ctrl-P>
vim.keymap.set({ 'n', 'v', 'i' }, '<C-p>', '<CMD>Telescope find_files<CR>')

-- open telescope "find in files" with <Shift-Ctrl-F>
vim.keymap.set({ 'n', 'v', 'i' }, '<S-C-f>', '<CMD>Telescope grep_string<CR>')

-- open oil with <Ctrl-O>
vim.keymap.set({ 'n', 'v', 'i' }, '<C-o>', '<CMD>Oil<CR>')
