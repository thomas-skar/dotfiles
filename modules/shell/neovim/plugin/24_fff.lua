local later, onchange, add, map = Config.later, Config.on_packchanged, Config.add, Config.map

---@diagnostic disable: missing-fields

later(function()
  onchange(
    'fff',
    { 'install', 'update' },
    function() require('fff.download').download_or_build_binary() end,
    'Download or build fff binary when fff is installed or updated'
  )

  add { { src = 'https://github.com/dmtrKovalenko/fff' } }

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

  map({ 'n', 'x' }, '<leader>ff', function() require('fff').find_files() end, 'Open file picker')
  map({ 'n', 'x', 'i' }, '<C-p>', function() require('fff').find_files() end, 'Open file picker')
  map({ 'n', 'x', 'i' }, '<S-C-p>', function() require('fff').find_files() end, 'Open file picker')

  -- WARN: conflict with possible lazygit map
  map({ 'n', 'x' }, '<leader>lg', function() require('fff').live_grep() end, 'Open live grep picker')
  map({ 'n', 'x', 'i' }, '<S-C-f>', function() require('fff').live_grep() end, 'Open live grep picker')
end)
