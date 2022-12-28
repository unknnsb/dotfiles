local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  -- Packer can manage itself
  use('wbthomason/packer.nvim')

  use('nvim-lua/plenary.nvim')
  use('kyazdani42/nvim-web-devicons')
  use('akinsho/nvim-bufferline.lua')

  -- Telescope
  use {
  	'nvim-telescope/telescope.nvim',
  	requires = { {'nvim-lua/plenary.nvim'} }
  }
  use('nvim-telescope/telescope-file-browser.nvim')

  -- Colorschemes
  use({
	  'rose-pine/neovim',
	  as = 'rose-pine'
  })
  use 'folke/tokyonight.nvim'
  use 'tjdevries/colorbuddy.vim'
  use 'svrana/neosolarized.nvim'

  -- Treesitter
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('windwp/nvim-ts-autotag')
  use('windwp/nvim-autopairs')
  use('nvim-treesitter/playground')

  -- Others
  use('theprimeagen/harpoon')
  use('tpope/vim-fugitive')
  use('nvim-lualine/lualine.nvim')

  -- Lsp & Cmp
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }

  use({
    "jackMort/ChatGPT.nvim",
      config = function()
        require("chatgpt").setup({
          -- optional configuration
        })
      end,
      requires = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim"
      }
  })

  use("lewis6991/impatient.nvim")
  if packer_bootstrap then
    require('packer').sync()
  end
end)
