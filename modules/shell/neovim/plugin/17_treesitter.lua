local later, add, autocmd = Config.later, Config.add, Config.new_autocmd

later(function()
  add { { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' } }

  local treesitter = require 'nvim-treesitter'

  treesitter.install {
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
    'regex',
    'starlark',
  }

  ---@param buf integer
  ---@param language string
  local function treesitter_try_attach(buf, language)
    if not vim.treesitter.language.add(language) then return end
    vim.treesitter.start(buf, language)
    local has_indent_query = vim.treesitter.query.get(language, 'indents') ~= nil
    if has_indent_query then vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" end
  end

  local available_parsers = treesitter.get_available()

  autocmd('FileType', '*', function(args)
    local buf, filetype = args.buf, args.match
    local language = vim.treesitter.language.get_lang(filetype)
    if not language then return end
    local installed_parsers = treesitter.get_installed 'parsers'
    if vim.tbl_contains(installed_parsers, language) then
      treesitter_try_attach(buf, language)
    elseif vim.tbl_contains(available_parsers, language) then
      treesitter.install(language):await(function() treesitter_try_attach(buf, language) end)
    else
      treesitter_try_attach(buf, language)
    end
  end, 'Install new treesitter languages')
end)
