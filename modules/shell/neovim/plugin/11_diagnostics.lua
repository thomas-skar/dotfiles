---@type vim.diagnostic.Opts
local diagnostic_opts = {
  severity_sort = true,
  update_in_insert = false,
  float = {
    border = 'rounded',
    source = 'if_many',
  },
  underline = true,
  virtual_text = true,
  signs = true,
  virtual_lines = false,
}

Config.later(function() vim.diagnostic.config(diagnostic_opts) end)
