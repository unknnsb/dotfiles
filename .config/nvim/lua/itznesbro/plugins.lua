local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap =
  fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
end

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'ThePrimeagen/harpoon'
  use 'lewis6991/impatient.nvim'

  -- lsp config
  use 'neovim/nvim-lspconfig'
  use 'glepnir/lspsaga.nvim'
  use 'jose-elias-alvarez/null-ls.nvim'

  -- treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

  -- colorscheme
  use {
    'svrana/neosolarized.nvim',
    requires = { 'tjdevries/colorbuddy.nvim' }
  }
  use 'gruvbox-community/gruvbox'
  use 'folke/tokyonight.nvim'
  use { 'catppuccin/nvim', as = 'catppuccin' }
  use { 'rose-pine/neovim', as = 'rose-pine' }
  use 'olivercederborg/poimandres.nvim'

  -- cmp
  use 'onsails/lspkind-nvim'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/nvim-cmp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- ui
  use 'nvim-lualine/lualine.nvim'
  use 'norcalli/nvim-colorizer.lua'
  use 'akinsho/nvim-bufferline.lua'

  -- git
  use 'lewis6991/gitsigns.nvim'
  use 'dinhhuy258/git.nvim'

  -- telescope
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
end)
