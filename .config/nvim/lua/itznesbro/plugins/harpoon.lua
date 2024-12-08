return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "plenary" },
    config = function()
      local harpoon = require("harpoon")

      -- REQUIRED
      harpoon:setup()
      -- REQUIRED

      vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
      vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

      vim.keymap.set("n", "<C-w>", function() harpoon:list():select(1) end)
      vim.keymap.set("n", "<C-r>", function() harpoon:list():select(2) end)
      vim.keymap.set("n", "<C-t>", function() harpoon:list():select(3) end)
      vim.keymap.set("n", "<C-k>", function() harpoon:list():select(4) end)
    end
  }
}
