-- finder.lua
-- Target: "nvim-telescope/telescope.nvim"

local util = require("utils")
-- Use a protected call so we don't error out on first use
local actions = require("telescope.actions")
local file_browser_actions = require("telescope").extensions.file_browser.actions
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
    initial_mode = "normal",
  },
  pickers = {
    -- Default Configuration for builtin pickers goes here
  },
  extensions = {
    -- Extension Configuration goes here
    file_browser = {
      hidden = true,
      grouped = true,
      initial_mode = "normal",
      auto_depth = 8,
      default_selection_index = 2,
      mappings = {
        i = {
          ["<C-h>"] = file_browser_actions.goto_parent_dir,
          ["<C-l>"] = actions.select_default,
          ["<C-H>"] = file_browser_actions.toggle_hidden,
        },
        n = {
          ["h"] = file_browser_actions.goto_parent_dir,
          ["l"] = actions.select_default,
          ["H"] = file_browser_actions.toggle_hidden,
        },
      },
      cwd = vim.fn.expand('%:p:h'),
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
util.map("n", "<Leader>f", ":Telescope file_browser<Cr>")
