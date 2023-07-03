local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- Install packer from github if is not in our system
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = vim.fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected require call (pcall) so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Show packer messages in a popup. Looks cooler
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes' 
  use 'tpope/vim-fugitive'
  use 'tpope/vim-sensible'
  use 'mhinz/vim-signify'
  use 'folke/tokyonight.nvim'
  use {
    'junegunn/fzf',
    run = function()
      vim.fn['fzf#install']()
    end
  }
  use 'junegunn/fzf.vim'
  use({
    -- Configure LSP client and Use an LSP server installer.
    "neovim/nvim-lspconfig",
    requires = {
      "williamboman/nvim-lsp-installer", -- Installs servers within neovim using :LspInstallInfo and using "i" on preffered server
      "onsails/lspkind-nvim",            -- adds vscode-like pictograms to neovim built-in lsp
    },
    config = function()
      require("config.lsp")
    end,
  })
  use 'hrsh7th/nvim-compe'
  use 'sheerun/vim-polyglot'
  use {
    'mg979/vim-visual-multi',
    branch = 'master'
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
    config = function()
      require("config.nvim-treesitter")
    end,
  }
  use({ -- CMP completion engine to show us available options
    "hrsh7th/nvim-cmp",
    requires = {
      "onsails/lspkind-nvim",     -- Icons on the popups
      "hrsh7th/cmp-nvim-lsp",     -- LSP source for nvim-cmp
      "saadparwaiz1/cmp_luasnip", -- Snippets source
      "L3MON4D3/LuaSnip",         -- Snippet engine
    },
    config = function()
      require("config.cmp")
    end,
  })
  use {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({})
    end,
  }
  use {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function ()
      require("copilot_cmp").setup()
    end
  }
end)