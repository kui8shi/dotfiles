local util = require("utils")
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
  vim.cmd.packadd("packer.nvim")
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
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- Install your plugins here
packer.startup(function()
  use({ "wbthomason/packer.nvim" })
  use({ "nvim-lua/plenary.nvim" }) -- Common utilities

  -- Colorschemes
  use({ "cocopon/iceberg.vim" }) -- Color scheme

  -- Status Line
  use({ "nvim-lualine/lualine.nvim", 
    run = util.safe_require("lualine",{}) }) -- Statusline
  use({ "windwp/nvim-autopairs", 
    run = util.safe_require("nvim-autopairs",{}) }) -- Autopairs, integrates with both cmp and treesitter
  use({ "akinsho/bufferline.nvim", 
    run = util.safe_require("bufferline",{}) })

  -- Completion Plugins
  use({ "hrsh7th/nvim-cmp" }) -- The completion plugin
  use({ "hrsh7th/cmp-buffer" }) -- buffer completions
  use({ "hrsh7th/cmp-path" }) -- path completions
  use({ "hrsh7th/cmp-nvim-lsp" })
  use({ "onsails/lspkind-nvim" })
  -- use({ "github/copilot.vim" })

  -- Snippets
  use({ "hrsh7th/vim-vsnip" }) --snippet engine

  -- LSP
  use({ "neovim/nvim-lspconfig" }) -- enable LSP
  use({ "williamboman/mason.nvim" }) -- simple to use language server installer
  use({ "williamboman/mason-lspconfig.nvim" }) -- bridge between mason and nvim-lspconfig
  -- use{ "glepnir/lspsaga.nvim", run = require("lspsaga").setup() } -- LSP UIs

  -- Formatter
  --use({ "jose-elias-alvarez/null-ls.nvim" }) -- for formatters and linters
  -- (I want to only use Mason but formatters needs to be well configured. so I choose null-ls)

  -- Fuzz Finder
  use({ "nvim-telescope/telescope.nvim" })
  use({ "nvim-telescope/telescope-file-browser.nvim" })

  -- Treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    config = function ()
      local ok, treesitter = pcall(require, "nvim-treesitter.configs")
      if ok then
        treesitter.setup({
          highlight = {
            enabled = true,
            disable = {
              'lua',
              'toml',
              'rust',
            }
          },
          indent = {
            enabled = true,
          }
        })
        -- see https://github.com/nvim-treesitter/nvim-treesitter/wiki/Installation#packernvim
        vim.api.nvim_create_autocmd({'BufEnter','BufAdd','BufNew','BufNewFile','BufWinEnter'}, {
          group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
          callback = function()
            vim.opt.foldmethod     = 'expr'
            vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
          end
        })
      end
    end,
    -- run = require('nvim-treesitter.install').update({ with_sync = true })
  })

  -- Explorer
  
  use({
    "kevinhwang91/rnvimr",
    run = {
      util.safe_require("rnvimr",{}),
      util.map("n", "<Leader>e", ":RnvimrToggle<CR>"),
    },
  })
  -- Git
  use({
    "akinsho/git-conflict.nvim",
    tag = "*",
    config = util.safe_require("git-conflict",{}),
  })

  -- Navigation
  use({ 
    "ggandor/leap.nvim",
    config = function()
      require("leap").add_default_mappings()
    end
  })
  
  -- Others
  use({ "nvim-tree/nvim-web-devicons", config = util.safe_require("nvim-web-devicons", {default=true, strict=true})})
  use({ "notjedi/nvim-rooter.lua", run = util.safe_require("nvim-rooter",{}) })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
