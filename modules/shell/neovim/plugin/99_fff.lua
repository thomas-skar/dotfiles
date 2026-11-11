---@diagnostic disable: missing-fields

vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'fff' and (kind == 'install' or kind == 'update') then
      if not ev.data.active then vim.cmd.packadd 'fff' end
      require('fff.download').download_or_build_binary()
    end
  end,
})

vim.pack.add {
  { src = 'https://github.com/dmtrKovalenko/fff' },
}

Config.later(function()
  ---@type FffConfig
  local config = {
    prompt = '> ',
    title = 'fff',
    lazy_sync = true,
    layout = {
      border = 'rounded',
    },
    preview = {
      enabled = true,
    },
    debug = { enabled = true, show_scores = true },
  }

  require('fff').setup(config)

  vim.keymap.set({ 'n', 'v', 'i' }, '<C-p>', function() require('fff').find_files() end)
  vim.keymap.set({ 'n', 'v', 'i' }, '<S-C-p>', function() require('fff').find_files() end)
  vim.keymap.set({ 'n', 'v', 'i' }, '<S-C-f>', function() require('fff').live_grep() end)
end)
