local map = Config.map

-- TODO: terminal map(s)
-- TODO: maps to fold/unfold sections

-- unbind keys
map('n', '.', '<nop>', 'Unbind .')
map({ 'n', 'x' }, 's', '<Nop>', 'Unbind s (delete character under cursor)')
map('n', '<C-c>', '<nop>', 'Unbind <Ctrl-C>')
map({ 'n', 'v', 'i', 't', 'c' }, '<M-C-D-">', '<Nop>', 'Unbind <Copilot+2')
map({ 'n', 'v', 'i', 't', 'c' }, '<M-C-D-#>', '<Nop>', 'Unbind <Copilot+3')
map({ 'n', 'v', 'i', 't', 'c' }, '<M-C-D-¤>', '<Nop>', 'Unbind <Copilot+4')
map({ 'n', 'v', 'i', 't', 'c' }, '<M-C-D-%>', '<Nop>', 'Unbind <Copilot+5')
map({ 'n', 'v', 'i', 't', 'c' }, '<M-C-D-&>', '<Nop>', 'Unbind <Copilot+6')
map({ 'n', 'v', 'i', 't', 'c' }, '<M-C-D-/>', '<Nop>', 'Unbind <Copilot+7')
map({ 'n', 'v', 'i', 't', 'c' }, '<M-C-D-(>', '<Nop>', 'Unbind <Copilot+8')
map({ 'n', 'v', 'i', 't', 'c' }, '<M-C-D-)>', '<Nop>', 'Unbind <Copilot+9')
map({ 'n', 'v', 'i', 't', 'c' }, '<M-C-D-=>', '<Nop>', 'Unbind <Copilot+0')

-- override keys
map({ 'n', 'x' }, 'd', '"_d', 'Delete without yanking text')
map('n', 'dd', '"_dd', 'Delete without yanking text')

-- <leader> mappings
map('n', '<leader><space>', 'i', 'Enter insert mode')
map('n', '<leader>re', '<CMD>restart!<CR>', 'Restart neovim')
map('n', '<leader>lo', '<CMD>messages<CR>', 'Show logs')
map('n', '<leader>sr', '<CMD>vsplit<CR>', 'Split right')
map('n', '<leader>sd', '<CMD>split<CR>', 'Split down')

-- general
map('n', '<C-f>', '/', 'Search')
map({ 'n', 'i', 'x' }, '<C-s>', '<CMD>update | redraw<CR>', 'Save buffer')
map({ 'n', 'x' }, '<C-a>', 'ggVG', 'Select everything')
map({ 'n', 'i' }, '<C-.>', '<CMD>lua vim.lsp.buf.code_action()<CR>', 'Show LSP code actions')

-- ???
map('x', '<C-c>', 'y', 'Copy in visual mode')
map('n', '<C-l>', 'V', 'Select line in normal mode')
map('i', '<C-l>', '<Esc>V', 'Select line in insert mode')
map('n', '<C-c>', 'Vy', 'Copy in normal mode')
map('n', '<C-x>', 'Vx', 'Cut in normal mode')
map('x', '<C-x>', 'x', 'Cut in visual mode')
map('n', '<C-v>', 'p', 'Paste in normal mode')
map('i', '<C-v>', '<C-O>p', 'Paste in insert mode')
map({ 'n', 'i', 'x' }, '<C-z>', '<CMD>undo<CR>', 'Undo')
map({ 'n', 'i', 'x' }, '<S-C-z>', '<CMD>redo<CR>', 'Redo')
map('n', '<S-Up>', 'v<Up>', 'Enter visual mode (up)')
map('n', '<S-Down>', 'v<Down>', 'Enter visual mode (down)')
map('n', '<S-Left>', 'v<Left>', 'Enter visual mode (left)')
map('n', '<S-Right>', 'v<Right>', 'Enter visual mode (right)')
map('i', '<S-Up>', '<C-O>v<Up>', 'Enter visual mode (up)')
map('i', '<S-Down>', '<C-O>v<Down>', 'Enter visual mode (down)')
map('i', '<S-Left>', '<C-O>v<Left>', 'Enter visual mode (left)')
map('i', '<S-Right>', '<C-O>v<Right>', 'Enter visual mode (right)')
map('x', '<S-Up>', '<Up>', 'Move selection up')
map('x', '<S-Down>', '<Down>', 'Move selection down')
map('i', '<C-BS>', '<C-W>', 'Delete word')
map('i', '<D-BS>', '<C-O>d0', 'Delete line')
map({ 'n', 'x' }, '<A-Left>', 'b', 'Move cursor left')
map({ 'n', 'x' }, '<A-Right>', 'w', 'Move cursor right')
map('i', '<A-Left>', '<C-O>b', 'Move cursor left')
map('i', '<A-Right>', '<C-O>w', 'Move cursor right')
map('x', '<S-A-Left>', 'b', 'Move cursor left')
map('x', '<S-A-Right>', 'w', 'Move cursor right')
map({ 'n', 'x' }, '<D-Left>', '_', 'Jump to start of line')
map({ 'n', 'x' }, '<D-Right>', '$', 'Jump to end of line')
map('i', '<D-Left>', '<C-O>_', 'Jump to start of line')
map('i', '<D-Right>', '<C-O>$', 'Jump to end of line')
map('x', '<S-D-Left>', '_', 'Jump to start of line')
map('x', '<S-D-Right>', '$', 'Jump to end of line')
map('n', '<D-Up>', '<CMD>goto<CR>', 'Jump to start of file') -- gg
map('n', '<D-Down>', 'G$', 'Jump to end of file')
map('x', 'l', '<S-v>', 'Enter visual line mode')
map('x', '<A-Up>', ":m '<-2<cr>gv=gv", 'Move selection up')
map('x', 'i', '<Esc>i', 'Enter insert mode')
map('i', '<S-Tab>', '<C-D>', 'Outdent') -- or <<
map('x', 'c', 'y', 'Yank with C in visual mode')
