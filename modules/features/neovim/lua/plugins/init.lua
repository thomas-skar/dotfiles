-- TODO: https://echasnovski.com/blog/2026-03-13-a-guide-to-vim-pack

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

require 'plugins.copilot'
require 'plugins.blink'
require 'plugins.conform'
require 'plugins.mini'
require 'plugins.monokai-pro'
require 'plugins.oil'
require 'plugins.todo-comments'
require 'plugins.treesitter'
require 'plugins.bufferline'
require 'plugins.snacks'
require 'plugins.markview'
require 'plugins.lazydev' -- TODO
require 'plugins.gitsigns'
require 'plugins.satellite'

-- require 'plugins.hover'
-- require 'plugins.noice'
-- require 'plugins.lualine'
-- require 'plugins.hover'
