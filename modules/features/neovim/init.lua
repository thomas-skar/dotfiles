--[[ options ]]
do
  require('vim._core.ui2').enable {
    enable = true,
  }

  if vim.loader then vim.loader.enable() end

  vim.g.mapleader = ' '
  vim.g.maplocalleader = ' '
  vim.g.have_nerd_font = true

  -- disable netrw
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1

  -- providers?
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
  vim.opt.winborder = 'rounded'
  vim.opt.pumborder = 'rounded'
  vim.opt.laststatus = 3

  -- delays, etc
  vim.o.updatetime = 500

  -- search
  vim.opt.ignorecase = true
  vim.opt.smartcase = true

  -- splits
  vim.opt.splitright = true
  vim.opt.splitbelow = true

  -- completion menu
  vim.o.autocomplete = true
  vim.opt.completeopt = 'menu,menuone,noselect,popup'

  -- clipboard
  vim.opt.clipboard = 'unnamedplus'

  -- mouse mode
  vim.opt.mouse = 'a'
end

--[[ keymaps ]]
do
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
end

--[[ autocmds ]]
do
  -- save changes when leaving insert mode
  vim.api.nvim_create_autocmd('InsertLeave', {
    pattern = '*',
    callback = function()
      if vim.bo.modified and vim.bo.buftype == '' then vim.cmd 'silent! update' end
    end,
  })

  -- show lsp hover on cursor hold
  vim.api.nvim_create_autocmd('CursorHold', {
    callback = function()
      if next(vim.lsp.get_clients { bufnr = 0 }) ~= nil then vim.lsp.buf.hover { focusable = false, silent = true } end
    end,
  })

  -- plugin build hook(s)
  vim.api.nvim_create_autocmd('PackChanged', {
    callback = function(ev)
      local name = ev.data.spec.name
      local kind = ev.data.kind
      if kind ~= 'install' and kind ~= 'update' then return end

      if name == 'telescope-fzf-native.nvim' and vim.fn.executable 'make' == 1 then
        local result = vim.system({ 'make' }, { cwd = ev.data.spec }):wait()
        if result.code ~= 0 then
          local stderr = result.stderr or ''
          local stdout = result.stdout or ''
          local output = stderr ~= '' and stderr or stdout
          if output == '' then output = 'No output from build command.' end
          vim.notify(('Build failed for %s:\n%s'):format(name, output), vim.log.levels.ERROR)
        end
        return
      end
    end,
  })
end

--[[ plugins: colorscheme ]]
do
  vim.pack.add { 'https://github.com/khoido2003/monokai-v2.nvim' }
  require('monokai-v2').setup {
    devicons = true,
    terminal_colors = true,
    filter = 'pro',
    treesitter = { italic = false },
    background_clear = { 'telescope', 'nvim-tree', 'float_win' },
  }
  vim.cmd.colorscheme 'monokai-v2'

  -- vim.pack.add { 'https://github.com/loctvl842/monokai-pro.nvim' }
  -- require('monokai-pro').setup {}
  -- vim.cmd.colorscheme 'monokai-pro'
end

--[[ plugins: mini ]]
do
  vim.pack.add { 'https://github.com/nvim-mini/mini.nvim' }

  if vim.g.have_nerd_font then
    require('mini.icons').setup { style = 'ascii' }
    vim.cmd ':lua MiniIcons.mock_nvim_web_devicons()'
  end
  require('mini.statusline').setup { use_icons = vim.g.have_nerd_font }
  require('mini.tabline').setup {}
  require('mini.cmdline').setup {
    autocomplete = {
      enable = true,
      map_arrows = true,
    },
  }
  require('mini.notify').setup {
    lsp_progress = {
      enable = false,
      level = 'WARN',
    },
  }
  require('mini.indentscope').setup {
    draw = {
      animation = require('mini.indentscope').gen_animation.none(),
    },
  }
  require('mini.cursorword').setup {}
end

--[[ plugins: todo-comments ]]
do
  vim.pack.add { 'https://github.com/folke/todo-comments.nvim' }
  require('todo-comments').setup { signs = false }
end

--[[ plugins: nvim-tree ]]
do
  vim.pack.add { 'https://github.com/nvim-tree/nvim-tree.lua' }

  -- ---@type nvim_tree.config
  -- local config = {}

  require('nvim-tree').setup {
    hijack_cursor = true,
    hijack_netrw = true,
    respect_buf_cwd = true,
    sync_root_with_cwd = true,
    auto_reload_on_write = true,
    view = {
      side = 'left',
      number = false,
      cursorline = true,
    },
    update_focused_file = {
      enable = true,
      update_root = true,
    },
  }
end

--[[ plugins: oil ]]
do
  vim.pack.add { 'https://github.com/stevearc/oil.nvim' }
  require('oil').setup {
    default_file_explorer = false,
    delete_to_trash = true,
    view_options = {
      show_hidden = true,
    },
    float = {
      border = 'rounded',
    },
  }
end

--[[ plugins: telescope ]]
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

--[[ diagnostics ]]
do
  vim.diagnostic.config {
    severity_sort = true,
    update_in_insert = false,
    float = {
      border = 'rounded',
      source = 'if_any',
    },
    underline = true,
  }
end

--[[ lsp ]]
do
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  vim.lsp.config('*', {
    capabilities = capabilities,
  })

  vim.lsp.config('lua_ls', {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    settings = {
      Lua = {
        codeLens = { enable = true },
        hint = { enable = true, semicolon = 'Disable' },
        diagnostics = {
          globals = { 'vim' },
        },
        workspace = {
          checkThirdParty = false,
          library = {
            vim.env.VIMRUNTIME,
          },
        },
        telemetry = {
          enable = false,
        },
      },
    },
  })

  vim.lsp.config('gopls', {
    cmd = { 'gopls' },
    filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
    settings = {
      gopls = {
        semanticTokens = true,
        staticcheck = true,
        gofumpt = true,
        usePlaceholders = true,
        analyses = {
          unusedparams = true,
          shadow = true,
        },
        hints = {
          assignVariableTypes = true,
          compositeLiteralFields = true,
          compositeLiteralTypes = true,
          constantValues = true,
          functionTypeParameters = true,
          parameterNames = true,
          rangeVariableTypes = true,
        },
      },
    },
  })

  vim.lsp.enable { 'lua_ls', 'gopls' }
end

--[[ formatting ]]
do
  vim.pack.add { 'https://github.com/stevearc/conform.nvim' }
  require('conform').setup {
    formatters_by_ft = {
      lua = { 'stylua' },
      go = { 'gofmt', 'goimports' },
    },
    default_format_opts = { lsp_format = 'fallback' },
  }
end

--[[ completion ]]
do
end

--[[ treesitter ]]
do
  vim.pack.add { { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' } }

  require('nvim-treesitter').install {
    'bash',
    'lua',
    'luadoc',
    'nix',
    'markdown',
    'markdown_inline',
    'vim',
    'vimdoc',
    'go',
    'toml',
    'css',
    'dockerfile',
    'fish',
    'gomod',
    'gosum',
    'gotmpl',
    'html',
    'graphql',
    'javascript',
    'json',
    'just',
    'python',
    'sql',
    'tsx',
    'typescript',
    'xml',
    'yaml',
  }

  ---@param buf integer
  ---@param language string
  local function treesitter_try_attach(buf, language)
    if not vim.treesitter.language.add(language) then return end
    vim.treesitter.start(buf, language)
    local has_indent_query = vim.treesitter.query.get(language, 'indents') ~= nil
    if has_indent_query then vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" end
  end

  local available_parsers = require('nvim-treesitter').get_available()
  vim.api.nvim_create_autocmd('FileType', {
    callback = function(args)
      local buf, filetype = args.buf, args.match
      local language = vim.treesitter.language.get_lang(filetype)
      if not language then return end
      local installed_parsers = require('nvim-treesitter').get_installed 'parsers'
      if vim.tbl_contains(installed_parsers, language) then
        treesitter_try_attach(buf, language)
      elseif vim.tbl_contains(available_parsers, language) then
        require('nvim-treesitter').install(language):await(function() treesitter_try_attach(buf, language) end)
      else
        treesitter_try_attach(buf, language)
      end
    end,
  })
end
