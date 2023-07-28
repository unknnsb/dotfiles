-- require('poimandres').setup {
--   -- bold_vert_split = false, -- use bold vertical separators
--   -- dim_nc_background = false, -- dim 'non-current' window backgrounds
--   disable_background = false, -- disable background
--   disable_float_background = false, -- disable background for floats
--   disable_italics = false, -- disable italics
-- }

require("vitesse").setup {
  comment_italics = true,
  transparent_background = true,
  transparent_float_background = true, -- aka pum(popup menu) background
  reverse_visual = false,
  dim_nc = false,
  cmp_cmdline_disable_search_highlight_group = false, -- disable search highlight group for cmp item
  -- if `transparent_float_background` false, make telescope border color same as float background
  telescope_border_follow_float_background = false,
  -- diagnostic virtual text background, like error lens
  diagnostic_virtual_text_background = false,
}
