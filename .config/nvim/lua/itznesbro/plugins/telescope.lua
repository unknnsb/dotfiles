return {  
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-telescope/telescope-file-browser.nvim"
  },
  config = function() 
    local telescope = require('telescope')
    local builtin = require('telescope.builtin')
    local actions = require('telescope.actions')

   local fb_actions = require "telescope".extensions.file_browser.actions

    telescope.setup {
      defaults = {
        mappings = {
          n = {
            ["q"] = actions.close
          },
        },
      },
      extensions = {
        file_browser = {
          theme = "dropdown",
          hijack_netrw = true,
          mappings = {
            ["i"] = {
              ["<C-w>"] = function() vim.cmd('normal vbd') end,
            },
            ["n"] = {
              ["N"] = fb_actions.create,
              ["h"] = fb_actions.goto_parent_dir,
              ["/"] = function()
                vim.cmd('startinsert')
              end
            },
          },
        },
      },
    }
    telescope.load_extension("file_browser")
  end
}
