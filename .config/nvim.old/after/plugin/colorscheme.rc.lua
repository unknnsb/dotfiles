-- tokyo night
require("tokyonight").setup({
  transparent = true,
})

local colorscheme = "tokyonight-night"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end
