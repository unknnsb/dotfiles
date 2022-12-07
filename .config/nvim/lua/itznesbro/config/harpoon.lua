require("harpoon").setup({
  menu = {
    width = vim.api.nvim_win_get_width(0) - 4,
  }
})

vim.keymap.set('n', '<leader>ht', ':lua require("harpoon.mark").add_file()<Return>')
vim.keymap.set('n', '<leader>hp', ':lua require("harpoon.ui").toggle_quick_menu()<Return>')
