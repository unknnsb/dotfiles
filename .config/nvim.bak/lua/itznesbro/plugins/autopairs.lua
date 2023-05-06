local M = {
  "windwp/nvim-autopairs",
  lazy = false
} 

function M.config()
  local autopairs = require("nvim-autopairs")

  autopairs.setup({
    disable_filetype = { "TelescopePrompt" , "vim" },
  })
end

return M
