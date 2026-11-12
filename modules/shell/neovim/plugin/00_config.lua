---@type "bufferline"|"mini"|nil
Config.tabline = 'bufferline'

---@type "visual"|"mini"|nil
Config.surround = 'visual'

---@type "neo-tree"|"nvim-tree"|"snacks"|nil
Config.tree = 'snacks'

---@type boolean
Config.basics = true

---@type boolean
Config.copilot = true

---@return integer[]
Config.listed_buffer_ids = function()
  ---@type integer[]
  local buf_ids = {}
  for _, buf_id in ipairs(vim.api.nvim_list_bufs()) do
    if vim.bo[buf_id].buflisted then table.insert(buf_ids, buf_id) end
  end
  return buf_ids
end
