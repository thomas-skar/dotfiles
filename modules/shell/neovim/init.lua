-- enable experimental lua module loader
if vim.loader then vim.loader.enable(true) end

-- enable experimental ui2
require('vim._core.ui2').enable { enable = true }

-- global config table, helper functions
_G.Config = {}

-- TODO: move functions to 00_config.lua

--- vim.keymap.set helper function.
---
---@param modes string|string[]
---@param keys string
---@param action string|function
---@param desc string
---@param opts? vim.keymap.set.Opts
---
Config.map = function(modes, keys, action, desc, opts)
  local o = { desc = desc }
  vim.keymap.set(modes, keys, action, vim.tbl_extend('keep', o, opts or {}))
end

local group = vim.api.nvim_create_augroup('custom', { clear = false })

--- vim.api.nvim_create_autocmd helper function.
---
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

--- vim.pack.add helper function.
---
--- @param specs (string|vim.pack.Spec)[]
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

-- load mini early to set up config helper functions
Config.add { 'https://github.com/nvim-mini/mini.nvim' }
local misc = require 'mini.misc'

--- Execute function _now_ using mini.safely.
---
---@param f function
Config.now = function(f) misc.safely('now', f) end

--- Execute function _later_ using mini.safely.
---
---@param f function
Config.later = function(f) misc.safely('later', f) end

--- Execute function _now_ or _later_ using mini.safely.
Config.maybe = vim.fn.argc(-1) > 0 and Config.now or Config.later

--- Execute function @ event using mini.safely.
---
---@param ev string
---@param f function
Config.on_event = function(ev, f) misc.safely('event:' .. ev, f) end

--- Execute function @ filetype using mini.safely.
---
---@param ft string
---@param f function
Config.on_filetype = function(ft, f) misc.safely('filetype:' .. ft, f) end
