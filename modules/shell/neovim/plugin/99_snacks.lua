Config.later(function()
  if Config.tree ~= 'snacks' then return end

  Config.add { { src = 'https://github.com/folke/snacks.nvim' } }

  ---@type snacks.Config
  local opts = {
    bigfile = { enabled = false },
    dashboard = { enabled = false },
    image = { enabled = false },
    input = { enabled = false },
    notifier = { enabled = false },
    quickfile = { enabled = false },
    scope = { enabled = false },
    scroll = { enabled = false },
    statuscolumn = { enabled = false },
    words = { enabled = false },
  }

  ---@type snacks.explorer.Config
  opts.explorer = {
    replace_netrw = false,
    trash = true,
  }

  ---@type snacks.picker.Config
  opts.picker = {
    ui_select = false,
    actions = {
      focus_main = function(picker) vim.api.nvim_set_current_win(picker.main) end,
    },
    sources = {
      explorer = {
        hidden = true,
        auto_close = false,
        jump = { close = false },
        win = {
          list = {
            keys = {
              ['<Esc>'] = { 'focus_main', mode = 'n' },
            },
          },
        },
        layout = {
          preview = 'main', -- FIXME:
          layout = {
            backdrop = {
              transparent = true,
              blend = 100,
              bg = 'Normal',
            },
            width = 40,
            min_width = 30,
            height = 0,
            position = 'left',
            border = 'none',
            box = 'vertical',
            { win = 'list', border = 'none' },
          },
        },
      },
    },
  }

  local snacks = require 'snacks'
  snacks.setup(opts)

  local function focus_explorer()
    ---@type snacks.Picker[]
    local explorer_pickers = snacks.picker.get { source = 'explorer' }
    if #explorer_pickers == 0 then
      snacks.explorer.reveal()
      -- TODO: autocmd to focus main?
      return
    end

    for _, v in pairs(explorer_pickers) do
      if not v:is_focused() then
        v:focus()
      else
        vim.api.nvim_set_current_win(v.main)
      end
    end
  end

  vim.keymap.set({ 'n', 'x', 't' }, '<C-e>', focus_explorer, { desc = 'Focus snacks explorer' })
  vim.keymap.set({ 'n', 'x', 't' }, '<S-C-e>', focus_explorer, { desc = 'Focus snacks explorer' })
end)
