return {
  {
    'stevearc/oil.nvim',
    dependencies = { "nvim-devicons" },
    config = function()
      require("oil").setup()
      vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
    end
  }
}
