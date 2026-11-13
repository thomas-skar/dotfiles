-- enable experimental lua module loader
if vim.loader then vim.loader.enable(true) end

-- enable experimental ui2
require('vim._core.ui2').enable { enable = true }

-- global config table
_G.Config = {}
