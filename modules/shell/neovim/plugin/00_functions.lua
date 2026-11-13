---@param modes string|string[]
---@param keys string
---@param action string|function
---@param desc string
---@param opts? vim.keymap.set.Opts
---@see vim.keymap.set
Config.map = function(modes, keys, action, desc, opts)
  local o = { desc = desc }
  vim.keymap.set(modes, keys, action, vim.tbl_extend('keep', o, opts or {}))
end

---@param specs (string|vim.pack.Spec)[]
---@param opts? vim.pack.keyset.add
---@see vim.pack.add
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

---@type integer
---@see vim.api.nvim_create_augroup
Config.augroup = vim.api.nvim_create_augroup('custom', { clear = true })

---@param event vim.api.keyset.events
---@param pattern string|string[]
---@param callback fun(args: vim.api.keyset.create_autocmd.callback_args): boolean?
---@param desc string
---@see vim.api.nvim_create_autocmd
Config.new_autocmd = function(event, pattern, callback, desc)
  vim.api.nvim_create_autocmd(event, {
    desc = desc,
    group = Config.augroup,
    pattern = pattern,
    callback = callback,
  })
end

---@param name string
---@param callback string|fun(args: vim.api.keyset.create_user_command.command_args)
---@param desc string
---@param opts? vim.api.keyset.user_command
---@see vim.api.nvim_create_user_command
Config.new_command = function(name, callback, desc, opts)
  local o = { desc = desc }
  vim.api.nvim_create_user_command(name, callback, vim.tbl_extend('keep', o, opts or {}))
end

Config.add { 'https://github.com/nvim-mini/mini.nvim' }
local misc = require 'mini.misc'

---Execute function _now_
---@param f function
Config.now = function(f) misc.safely('now', f) end

---Execute function _later_
---@param f function
Config.later = function(f) misc.safely('later', f) end

---Execute function _now_ or _later_
Config.maybe = vim.fn.argc(-1) > 0 and Config.now or Config.later

---Execute function @ event
---@param ev string
---@param f function
Config.on_event = function(ev, f) misc.safely('event:' .. ev, f) end

---Execute function @ filetype
---@param ft string
---@param f function
Config.on_filetype = function(ft, f) misc.safely('filetype:' .. ft, f) end

---Get all buffer ids for buffers where "buflisted" is true
---@return integer[]
---@see vim.api.nvim_list_bufs
Config.listed_buffer_ids = function()
  ---@type integer[]
  local buf_ids = {}
  for _, buf_id in ipairs(vim.api.nvim_list_bufs()) do
    if vim.bo[buf_id].buflisted then table.insert(buf_ids, buf_id) end
  end
  return buf_ids
end
