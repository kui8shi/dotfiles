vim.api.nvim_create_autocmd(
  {
    "BufNewFile",
    "BufRead",
  },
  {
    pattern = "*.inc",
    callback = function()
      local buf = vim.api.nvim_get_current_buf()
      vim.api.nvim_buf_set_option(buf, "filetype", "c")
    end
  }
)
