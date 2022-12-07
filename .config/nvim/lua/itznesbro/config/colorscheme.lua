vim.g.colorscheme = "poimandres"

-- Catppuccin
require("catppuccin").setup({
  transparent_background = false,
});

-- poimandres.nvim
require('poimandres').setup {
  disable_background = true, -- disable background
  disable_float_background = false, -- disable background for floats
}

-- Solarized
local status, n = pcall(require, "neosolarized")
if (not status) then return end

n.setup({
  comment_italics = true,
})

local cb = require('colorbuddy.init')
local Color = cb.Color
local colors = cb.colors
local Group = cb.Group
local groups = cb.groups
local styles = cb.styles

Color.new('black', '#000000')
Group.new('CursorLine', colors.none, colors.base03, styles.NONE, colors.base1)
Group.new('CursorLineNr', colors.yellow, colors.black, styles.NONE, colors.base1)
Group.new('Visual', colors.none, colors.base03, styles.reverse)

local cError = groups.Error.fg
local cInfo = groups.Information.fg
local cWarn = groups.Warning.fg
local cHint = groups.Hint.fg

Group.new("DiagnosticVirtualTextError", cError, cError:dark():dark():dark():dark(), styles.NONE)
Group.new("DiagnosticVirtualTextInfo", cInfo, cInfo:dark():dark():dark(), styles.NONE)
Group.new("DiagnosticVirtualTextWarn", cWarn, cWarn:dark():dark():dark(), styles.NONE)
Group.new("DiagnosticVirtualTextHint", cHint, cHint:dark():dark():dark(), styles.NONE)
Group.new("DiagnosticUnderlineError", colors.none, colors.none, styles.undercurl, cError)
Group.new("DiagnosticUnderlineWarn", colors.none, colors.none, styles.undercurl, cWarn)
Group.new("DiagnosticUnderlineInfo", colors.none, colors.none, styles.undercurl, cInfo)
Group.new("DiagnosticUnderlineHint", colors.none, colors.none, styles.undercurl, cHint)

vim.g.gruvbox_contrast_dark = 'hard'
vim.g.tokyonight_transparent_sidebar = true
vim.g.tokyonight_transparent = true
vim.g.gruvbox_invert_selection = '0'
vim.opt.background = "dark"

vim.cmd("colorscheme " .. vim.g.colorscheme)

local hl = function(thing, opts)
  vim.api.nvim_set_hl(0, thing, opts)
end

hl("SignColumn", {
  bg = "none",
})

hl("ColorColumn", {
  ctermbg = 0,
  bg = "#2B79A0",
})

hl("CursorLineNR", {
  bg = "None"
})

hl("Normal", {
  bg = "none"
})

hl("LineNr", {
  fg = "#5eacd3"
})

hl("netrwDir", {
  fg = "#5eacd3"
})
