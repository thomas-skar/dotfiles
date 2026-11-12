---@diagnostic disable: missing-fields

Config.later(function()
  Config.on_packchanged(
    'fff',
    { 'install', 'update' },
    function() require('fff.download').download_or_build_binary() end,
    'Download or build fff binary when fff is installed or updated'
  )

  Config.add { { src = 'https://github.com/dmtrKovalenko/fff' } }

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
