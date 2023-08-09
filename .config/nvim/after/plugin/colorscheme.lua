-- require('poimandres').setup {
--   -- bold_vert_split = false, -- use bold vertical separators
--   -- dim_nc_background = false, -- dim 'non-current' window backgrounds
--   disable_background = false, -- disable background
--   disable_float_background = false, -- disable background for floats
--   disable_italics = false, -- disable italics
-- }

-- require("vitesse").setup {
--   comment_italics = true,
--   transparent_background = true,
--   transparent_float_background = true, -- aka pum(popup menu) background
--   reverse_visual = false,
--   dim_nc = false,
--   cmp_cmdline_disable_search_highlight_group = false, -- disable search highlight group for cmp item
--   -- if `transparent_float_background` false, make telescope border color same as float background
--   telescope_border_follow_float_background = false,
--   -- diagnostic virtual text background, like error lens
--   diagnostic_virtual_text_background = false,
-- }

local status, n = pcall(require, "neosolarized")
if (not status) then return end

n.setup({
  comment_italics = true,
  background_set = true,
})

local cb = require('colorbuddy.init')
local Color = cb.Color
local colors = cb.colors
local Group = cb.Group
local groups = cb.groups
local styles = cb.styles

Color.new('white', '#ffffff')
Color.new('black', '#000000')
Group.new('Normal', colors.base1, colors.NONE, styles.NONE)
Group.new('CursorLine', colors.none, colors.base03, styles.NONE, colors.base1)
Group.new('CursorLineNr', colors.yellow, colors.black, styles.NONE, colors.base1)
Group.new('Visual', colors.none, colors.base03, styles.reverse)
Group.new('NormalFloat', colors.base1, colors.NONE, styles.NONE)

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

Group.new("HoverBorder", colors.yellow, colors.none, styles.NONE)

vim.cmd("colorscheme neosolarized")
