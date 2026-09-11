vim.pack.add { 'https://github.com/zbirenbaum/copilot.lua', 'https://github.com/copilotlsp-nvim/copilot-lsp' }

require('copilot').setup {
  panel = {
    enabled = false,
  },
  suggestion = {
    enabled = true,
  },
  nes = {
    enabled = false, -- TODO:
  },
  server = {
    type = 'binary',
  },
}
