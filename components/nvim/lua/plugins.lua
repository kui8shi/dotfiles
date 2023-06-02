-- Automatically install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = vim.fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer, close and reopen Neovim...")
  vim.cmd.packadd "packer.nvim"
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return error()
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
})

-- Install your plugins here
return packer.startup(function(use)
  use { "wbthomason/packer.nvim" }
  use { "nvim-lua/plenary.nvim" } -- Common utilities

  -- Colorschemes
  use { "cocopon/iceberg.vim" } -- Color scheme

  -- status line
  use { "nvim-lualine/lualine.nvim", 
        run = require("lualine").setup()} -- Statusline
  use { "windwp/nvim-autopairs" ,
        run = require("nvim-autopairs").setup()} -- Autopairs, integrates with both cmp and treesitter
  use { "akinsho/bufferline.nvim" ,
        run = require("bufferline").setup()}

  -- cmp plugins
  use { "hrsh7th/nvim-cmp" } -- The completion plugin
  use { "hrsh7th/cmp-buffer" } -- buffer completions
  use { "hrsh7th/cmp-path" } -- path completions
  use { "hrsh7th/cmp-nvim-lsp" }
  use { "onsails/lspkind-nvim" }

  -- snippets
  use { "hrsh7th/vim-vsnip" } --snippet engine

  -- LSP
  use { "neovim/nvim-lspconfig" } -- enable LSP
  use { "williamboman/mason.nvim" , { run = ":MasonUpdate" } } -- simple to use language server installer
  use { "williamboman/mason-lspconfig.nvim" } -- brith between mason and nvim-lspconfig
  use { "jose-elias-alvarez/null-ls.nvim" } -- for formatters and linters
  use { "glepnir/lspsaga.nvim" , { run = require("lspsaga").setup() }} -- LSP UIs

  -- Formatter
  use { "MunifTanjim/prettier.nvim",
        run = require("prettier").setup() }

  -- Telescope
  use { "nvim-telescope/telescope.nvim" }
  use { "nvim-telescope/telescope-file-browser.nvim" }

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" } }

  -- Explorer
  use { "nvim-tree/nvim-tree.lua", run = {
    require("nvim-tree").setup(),
    map("n", "<Leader>e", ":NvimTreeFindFileToggle<CR>")
  } }

  -- Others
  use { "notjedi/nvim-rooter.lua", 
      config = function() require 'nvim-rooter'.setup() end }
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
