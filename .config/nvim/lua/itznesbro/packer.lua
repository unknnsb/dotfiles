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
  use 'wbthomason/packer.nvim'

  use("stevearc/oil.nvim")

  use("nvim-lualine/lualine.nvim")

  use {
	  'nvim-telescope/telescope.nvim',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({
    'olivercederborg/poimandres.nvim',
	  as = 'poimandres',
	  -- config = function()
		 --  vim.cmd('colorscheme poimandres')
	  -- end
  })
  use {
    "2nthony/vitesse.nvim",
    requires = {
      "tjdevries/colorbuddy.nvim"
    },
    -- config = function()
    --   vim.cmd('colorscheme vitesse')
    -- end
  }
    use {
    'svrana/neosolarized.nvim'
  }
    use { 'tjdevries/colorbuddy.nvim' }

  use {
    "pmizio/typescript-tools.nvim",
    requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" }
  }

  use({
      "folke/trouble.nvim",
      config = function()
          require("trouble").setup {
              icons = true,
              -- your configuration comes here
              -- or leave it empty to use the default settings
              -- refer to the configuration section below
          }
      end
  })

  use {
			'nvim-treesitter/nvim-treesitter',
			run = function()
				local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
				ts_update()
			end,}
  use("nvim-treesitter/playground")
  use("theprimeagen/harpoon")
  use("theprimeagen/refactoring.nvim")
  use("mbbill/undotree")
  use("tpope/vim-fugitive")
  use("nvim-treesitter/nvim-treesitter-context");
  use("kyazdani42/nvim-web-devicons")
  use('windwp/nvim-autopairs')
  use('windwp/nvim-ts-autotag')
  use { 'numToStr/Comment.nvim',
    requires = {
      'JoosepAlviste/nvim-ts-context-commentstring'
    }
  }
  use('norcalli/nvim-colorizer.lua')
  use('folke/zen-mode.nvim')
  use('akinsho/nvim-bufferline.lua')
  use('lewis6991/gitsigns.nvim')

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},
      {'onsails/lspkind-nvim'},
      {'jose-elias-alvarez/null-ls.nvim'},
      {'glepnir/lspsaga.nvim'},

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

  if packer_bootstrap then
    require('packer').sync()
  end
end)
