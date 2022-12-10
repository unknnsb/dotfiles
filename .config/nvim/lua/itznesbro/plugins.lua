local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
  git = {
    clone_timeout = 300, -- Timeout, in seconds, for git clones
  },
}

return packer.startup(function(use)
  use { "wbthomason/packer.nvim" }
  use { "nvim-lua/plenary.nvim" }
  use { "lewis6991/impatient.nvim" }
  use { "kyazdani42/nvim-web-devicons" }
  use { "nvim-lualine/lualine.nvim" }
  use { "akinsho/nvim-bufferline.lua" }

  -- colorschemes
  use { "folke/tokyonight.nvim" }

  -- coc
  use { "neoclide/coc.nvim", branch = "release" }

  -- tree sitter
  use { "nvim-treesitter/nvim-treesitter" }
  use { "windwp/nvim-autopairs" }
  use { "windwp/nvim-ts-autotag" }

  -- telescope
  use { "nvim-telescope/telescope.nvim" }
  use { "nvim-telescope/telescope-file-browser.nvim" }

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
