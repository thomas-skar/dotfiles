-- 1. vim options
do
  if vim.loader then vim.loader.enable() end

  vim.g.mapleader = ' '
  vim.g.maplocalleader = ' '
  vim.g.have_nerd_font = true
  vim.o.number = true -- turn on line numbers
  vim.o.relativenumber = false -- turn off relative line numbers
  vim.o.mouse = 'a' -- enable mouse mode
  vim.o.showmode = false -- handled by statusline
  vim.o.breakindent = true
  vim.o.ignorecase = true
  vim.o.smartcase = true
  vim.o.signcolumn = 'yes'
  vim.o.updatetime = 250
  vim.o.timeoutlen = 300
  vim.o.splitright = true
  vim.o.splitbelow = true
  vim.o.cursorline = true
  vim.o.scrolloff = 10
  vim.o.confirm = true

  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1
end

-- 2. keymaps >:)
do
  -- clear search highlight with <Esc>
  vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

  -- search with <Ctrl-F>
  vim.keymap.set({ 'n', 'v' }, '<C-f>', '/')

  -- open the telescope file picket with <Ctrl-P>
  vim.keymap.set({ 'n', 'v', 'i' }, '<C-p>', '<CMD>Telescope find_files<CR>')

  -- open the telescope "find in files" with <Shift-Ctrl-F>
  vim.keymap.set({ 'n', 'v', 'i' }, '<S-C-f>', '<CMD>Telescope grep_string<CR>')

  -- open oil with <Ctrl-O>
  vim.keymap.set({ 'n', 'v', 'i' }, '<C-o>', '<CMD>Oil --float<CR>')
end

-- 3. plugin pre-reqs
do
  local function run_build(name, cmd, cwd)
    local result = vim.system(cmd, { cwd = cwd }):wait()
    if result.code ~= 0 then
      local stderr = result.stderr or ''
      local stdout = result.stdout or ''
      local output = stderr ~= '' and stderr or stdout
      if output == '' then output = 'No output from build command.' end
      vim.notify(('Build failed for %s:\n%s'):format(name, output), vim.log.levels.ERROR)
    end
  end

  vim.api.nvim_create_autocmd('PackChanged', {
    callback = function(ev)
      local name = ev.data.spec.name
      local kind = ev.data.kind
      if kind ~= 'install' and kind ~= 'update' then return end

      if name == 'telescope-fzf-native.nvim' and vim.fn.executable 'make' == 1 then
        run_build(name, { 'make' }, ev.data.path)
        return
      end
    end,
  })
end

-- 4. plugins
do
  -- [[ colorscheme ]]
  vim.pack.add { 'https://github.com/loctvl842/monokai-pro.nvim' }
  require('monokai-pro').setup {
    filter = 'pro',
    devicons = true,
  }
  vim.cmd.colorscheme 'monokai-pro'

  -- [[ mini ]]
  vim.pack.add { 'https://github.com/nvim-mini/mini.nvim' }

  -- [[ mini icons ]]
  if vim.g.have_nerd_font then require('mini.icons').setup() end

  -- [[ mini statusline ]]
  require('mini.statusline').setup { use_icons = vim.g.have_nerd_font }

  -- [[ mini tabline ]]
  require('mini.tabline').setup()

  -- [[ mini cmdline ]]
  require('mini.cmdline').setup {
    autocomplete = {
      enable = true,
      map_arrows = true,
    },
    autocorrect = {
      enable = true,
    },
    autopeek = {
      enable = true,
    },
  }

  -- [[ mini notify ]]
  require('mini.notify').setup {
    lsp_progress = {
      enable = true,
    },
  }

  -- [[ mini indentscope ]]
  require('mini.indentscope').setup {
    draw = {
      animation = require('mini.indentscope').gen_animation.none(),
    },
  }

  -- [[ mini cursorword ]]
  require('mini.cursorword').setup()

  -- [[ todo comments]]
  vim.pack.add { 'https://github.com/folke/todo-comments.nvim' }
  require('todo-comments').setup { signs = false }

  -- [[ oil  ]]
  vim.pack.add { 'https://github.com/stevearc/oil.nvim' }
  require('oil').setup {
    default_file_explorer = true,
    delete_to_trash = true,
    view_options = {
      show_hidden = true,
    },
    float = {
      border = 'rounded',
    },
  }
end

-- 5. telescope
do
  local telescope_plugins = {
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/nvim-telescope/telescope.nvim',
  }

  if vim.fn.executable 'make' == 1 then table.insert(telescope_plugins, 'https://github.com/nvim-telescope/telescope-fzf-native.nvim') end

  vim.pack.add(telescope_plugins)

  require('telescope').setup {
    defaults = {
      mappings = {
        i = {
          ['<esc>'] = require('telescope.actions').close,
        },
      },
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = 'smart_case',
      },
    },
  }
  pcall(require('telescope').load_extension, 'fzf')
end
