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
    use({ "nvim-lualine/lualine.nvim", run = require("lualine").setup() }) -- Statusline
    use({ "windwp/nvim-autopairs", run = require("nvim-autopairs").setup() }) -- Autopairs, integrates with both cmp and treesitter
    use({ "akinsho/bufferline.nvim", run = require("bufferline").setup() })

    -- Completion Plugins
    use({ "hrsh7th/nvim-cmp" }) -- The completion plugin
    use({ "hrsh7th/cmp-buffer" }) -- buffer completions
    use({ "hrsh7th/cmp-path" }) -- path completions
    use({ "hrsh7th/cmp-nvim-lsp" })
    use({ "onsails/lspkind-nvim" })

    -- Snippets
    use({ "hrsh7th/vim-vsnip" }) --snippet engine

    -- LSP
    use({ "neovim/nvim-lspconfig" }) -- enable LSP
    use({ "williamboman/mason.nvim", run = ":MasonUpdate" }) -- simple to use language server installer
    use({ "williamboman/mason-lspconfig.nvim" }) -- bridge between mason and nvim-lspconfig
    -- use{ "glepnir/lspsaga.nvim", run = require("lspsaga").setup() } -- LSP UIs

    -- Formatter
    --use({ "jose-elias-alvarez/null-ls.nvim" }) -- for formatters and linters
    -- (I want to only use Mason but formatters needs to be well configured. so I choose null-ls)

    -- Fuzz Finder
    use({ "nvim-telescope/telescope.nvim" })
    use({ "nvim-telescope/telescope-file-browser.nvim" })

    -- Treesitter
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

    -- Explorer
    use({
        "nvim-tree/nvim-tree.lua",
        run = {
            require("nvim-tree").setup(),
            util.map("n", "<Leader>e", ":NvimTreeFindFileToggle<CR>"),
        },
    })
    -- Git
    use({
        "akinsho/git-conflict.nvim",
        tag = "*",
        config = function()
            require("git-conflict").setup()
        end,
    })

    -- Deno
    -- SKK(Japanese Input)
    --use({
    --    "vim-skk/skkeleton",
    --    wants = { "denops.vim" },
    --    setup = function()
    --        vim.keymap.set("i", "jk", "<Plug>(skkeleton-toggle)")
    --        --vim.keymap.set("i", "jl", "<Plug>(skkeleton-disable)")
    --    end,
    --    config = function()
    --        local data_path = vim.fn.stdpath("data")
    --        local dictionary_source_path = data_path .. "/SKK-JISYO.M"
    --        local my_dictionary_path = data_path .. "/SKK-JISYO.MY"
    --        vim.fn["skkeleton#config"]({
    --            globalJisyo = dictionary_source_path,
    --            userJisyo = my_dictionary_path,
    --            markerHenkan = "<>",
    --            markerHenkanSelect = ">>",
    --            eggLikeNewline = true,
    --            --registerConvertResult = true,
    --        })
    --    end,
    --})
    -- Others
    use({ "nvim-tree/nvim-web-devicons", config = function()
          local status, icons = pcall(require, "nvim-web-devicons")
          if status then
              icons.setup({default = true, strict = true}) 
          end
        end})
    use({ "notjedi/nvim-rooter.lua", run = require("nvim-rooter").setup() })

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
