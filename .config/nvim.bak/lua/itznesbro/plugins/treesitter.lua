return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require'nvim-treesitter.configs'.setup {
      ensure_installed = { "help", "javascript", "typescript", "c", "lua", "rust", "tsx", "fish", "astro", "markdown", "markdown_inline"},
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      autotag = {
        enable = true
      },
      context_commentstring = {
        enable         = true,
        enable_autocmd = false,
      }
    }
  end
}
