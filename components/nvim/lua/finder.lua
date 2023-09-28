-- finder.lua
-- Target: "nvim-telescope/telescope.nvim"

local util = require("utils")
-- Use a protected call so we don't error out on first use
local actions = require("telescope.actions")
require("telescope").setup({
    defaults = {
        mappings = {
            n = {
                ["<esc>"] = actions.close,
            },
            i = {
                ["<esc>"] = actions.close,
            },
        },
        initial_mode = "insert",
    },
    pickers = {
        -- Default Configuration for builtin pickers goes here
    },
    extensions = {
        -- Extension Configuration goes here
        file_browser = {
            initial_mode = "normal",
            auto_depth = 8,
        },
    },
})
require("telescope").load_extension("file_browser")

-- Finder Key Bindings
-- builtin
util.map("n", "<Leader>t", ":Telescope treesitter<Cr>")
util.map("n", "<Leader>/", ":Telescope current_buffer_fuzzy_find<Cr>")
util.map("n", "<Leader>a", ":Telescope live_grep<Cr>")
util.map("n", "<Leader>b", ":Telescope buffers<Cr>")
-- extensions
util.map("n", "<Leader>f", ":Telescope file_browser initial_mode=insert<Cr>")
