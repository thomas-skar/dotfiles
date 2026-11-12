-- enable experimental lua module loader
if vim.loader then vim.loader.enable(true) end

-- enable experimental ui2
require('vim._core.ui2').enable { enable = true }

-- global config table
_G.Config = {}

-- autocmd helper
do
  local group = vim.api.nvim_create_augroup('custom', {})

  ---@param event vim.api.keyset.events
  ---@param pattern string|string[]
  ---@param callback fun(args: vim.api.keyset.create_autocmd.callback_args): boolean?
  ---@param desc string
  Config.new_autocmd = function(event, pattern, callback, desc)
    vim.api.nvim_create_autocmd(event, {
      desc = desc,
      group = group,
      pattern = pattern,
      callback = callback,
    })
  end
end

-- vim.pack helpers
do
  --- @param specs vim.pack.Spec[]
  --- @param opts? vim.pack.keyset.add
  Config.add = function(specs, opts) vim.pack.add(specs, opts) end

  ---@param plugin_name string
  ---@param kinds string[]
  ---@param callback fun(data?: any)
  ---@param desc string
  Config.on_packchanged = function(plugin_name, kinds, callback, desc)
    Config.new_autocmd('PackChanged', '*', function(ev)
      local name, kind = ev.data.spec.name, ev.data.kind
      if not (name == plugin_name and vim.tbl_contains(kinds, kind)) then return end
      if not ev.data.active then vim.cmd.packadd(plugin_name) end
      callback(ev.data)
    end, desc)
  end
end

-- load mini early to set up config helper functions
do
  vim.pack.add { 'https://github.com/nvim-mini/mini.nvim' }

  local misc = require 'mini.misc'

  ---@param f function
  Config.now = function(f) misc.safely('now', f) end

  ---@param f function
  Config.later = function(f) misc.safely('later', f) end
  Config.maybe = vim.fn.argc(-1) > 0 and Config.now or Config.later

  ---@param ev string
  ---@param f function
  Config.on_event = function(ev, f) misc.safely('event:' .. ev, f) end

  ---@param ft string
  ---@param f function
  Config.on_filetype = function(ft, f) misc.safely('filetype:' .. ft, f) end
end
