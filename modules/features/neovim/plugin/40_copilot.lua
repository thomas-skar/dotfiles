vim.pack.add {
  'https://github.com/zbirenbaum/copilot.lua',
  'https://github.com/copilotlsp-nvim/copilot-lsp',
}

require('copilot').setup {
  panel = {
    enabled = false,
  },
  suggestion = {
    enabled = true,
    auto_trigger = true,
    hide_during_completion = true,
    trigger_on_accept = true,
    keymap = {
      accept = '<Tab>',
      dismiss = '<Esc>',
    },
  },
  nes = {
    enabled = false,
  },
  server = {
    type = 'binary',
  },
  server_opts_overrides = {
    settings = {
      telemetry = {
        telemetryLevel = 'off', -- default: "all"
      },
    },
  },
}
