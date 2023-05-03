local M = {
  "lewis6991/gitsigns.nvim"
}

function M.config()
  local status, gitsigns = pcall(require, "gitsigns")
  if (not status) then return end

  gitsigns.setup {}
end

return M
