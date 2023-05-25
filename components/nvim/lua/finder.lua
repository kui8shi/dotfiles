-- finder.lua
-- Target: "nvim-telescope/telescope.nvim"

require("utils")
-- Use a protected call so we don't error out on first use
local actions = require("telescope.actions")
require("telescope").setup {
  defaults = {
    mappings = {
      n = {
        ["<esc>"] = actions.close,
      },
      i = {
        ["<esc>"] = actions.close,
      }
    },
    initial_mode = "insert",
  },
  pickers = {
    -- Default Configuration for builtin pickers goes here
  },
  extensions = {
    -- Extension Configuration goes here
    file_browser = {
      hijack_netrw = true,
      initial_mode = "normal",
      auto_depth = 4,
    }
  }
}
require("telescope").load_extension("file_browser")

-- Finder Key Bindings
-- builtin
map("n", "<Leader>t", ":Telescope treesitter<Cr>")
map("n", "<Leader>/", ":Telescope current_buffer_fuzzy_find<Cr>")
map("n", "<Leader>a", ":Telescope live_grep<Cr>")
map("n", "<Leader>b", ":Telescope buffers<Cr>")
-- extensions
map("n", "<Leader>f", ":Telescope file_browser initial_mode=insert<Cr>")
