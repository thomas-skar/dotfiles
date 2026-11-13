local now = Config.now
local tree = Config.tree

now(function()
  if tree ~= 'netrw' then
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    return
  end

  -- TODO:
end)
