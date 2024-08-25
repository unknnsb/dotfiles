-- return {
--   {
--     "craftzdog/solarized-osaka.nvim",
--     lazy = true,
--     priority = 1000,
--     opts = function()
--       return {
-- 				transparent = true,
--       }
--     end,
--   }
-- }
--
return {
  "rose-pine/neovim",
  name = "rose-pine",
  lazy = true,
  priority = 1000,
  opts = function()
    return {
       disable_background = true
    }
  end
}
