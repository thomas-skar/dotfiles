if not Config.mason then return end

local later, add = Config.later, Config.plugins.add

later(function()
  -- TODO: mason vs nix
  add { 'https://github.com/mason-org/mason.nvim' }
end)
