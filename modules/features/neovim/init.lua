-- enable experimental lua module loader
if vim.loader then vim.loader.enable() end

-- enable experimental ui2
require('vim._core.ui2').enable { enable = true }

------------------------------------------------------------------------------------

-- leader key(s)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- enable nerd fonts
vim.g.have_nerd_font = true

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- disable providers?
vim.g.loaded_node_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- display
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.showmode = false
vim.opt.signcolumn = 'yes'
vim.opt.cursorline = true
vim.opt.cursorcolumn = false
vim.opt.winborder = 'rounded'
vim.opt.pumborder = 'rounded'
vim.opt.laststatus = 3
vim.opt.ruler = true

-- indentation
vim.opt.autoindent = true
vim.opt.smartindent = true

-- delays, etc
vim.opt.updatetime = 250
vim.opt.timeoutlen = 250

-- search?
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- scrolling
vim.opt.scrolloff = 5

-- splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- completion menu
vim.opt.autocomplete = false
vim.opt.completeopt = 'menu,menuone,noselect,popup'

-- clipboard
vim.opt.clipboard = 'unnamedplus'

-- enable mouse clicks
vim.opt.mouse = 'a'
vim.opt.mousemoveevent = true

-- undofile
vim.opt.undofile = true

-- swapfile
vim.opt.swapfile = false

-- hidden characters
vim.opt.list = false
vim.opt.listchars:append { eol = '↲', tab = '>-', trail = '~' }

-- navigation (jump between lines with arrow keys)
vim.opt.whichwrap:append '<,>,[,]'

-- spaces and tabs
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smarttab = true

-- navigation
vim.opt.virtualedit:append 'onemore'

-- line wrap
vim.opt.wrap = false

------------------------------------------------------------------------------------

if vim.g.neovide then
  -- font
  vim.o.guifont = 'JetBrainsMono Nerd Font:h12'

  -- misc TODO:
  vim.g.neovide_theme = 'auto'
  vim.g.neovide_scale_factor = 1.0
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_confirm_quit = true
  vim.g.neovide_fullscreen = true
  vim.g.neovide_has_mouse_grid_detection = true

  -- window animations
  vim.g.neovide_position_animation_length = 0

  -- scroll animations, etc
  vim.g.neovide_scroll_animation_length = 0.15
  vim.g.neovide_scroll_animation_far_lines = 2

  -- cursor animcations, etc
  vim.g.neovide_cursor_animation_length = 0
  vim.g.neovide_cursor_animate_command_line = true
  vim.g.neovide_cursor_antialiasing = true
  vim.g.neovide_cursor_animate_in_insert_mode = true
  vim.g.neovide_cursor_smooth_blink = true
  vim.g.neovide_cursor_hack = true

  -- progress bar
  vim.g.neovide_progress_bar_enabled = true
  vim.g.neovide_progress_bar_height = 4.0
  vim.g.neovide_progress_bar_animation_speed = 200.0
  vim.g.neovide_progress_bar_hide_delay = 0.2

  -- padding
  vim.g.neovide_padding_top = 12
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_right = 4
  vim.g.neovide_padding_left = 4

  -- profiler
  vim.g.neovide_profiler = false
end

------------------------------------------------------------------------------------

require 'autocmds'
require 'keymaps'
require 'diagnostics'
-- require 'lsp'
