vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.tex",
  callback = function()
    local current_file = vim.fn.expand("%:p")
    local current_dir = vim.fn.fnamemodify(current_file, ":h")

    -- Find Makefile directory
    local makefile_dir = vim.fn.findfile("Makefile", current_dir .. ";")
    if makefile_dir ~= "" then
      makefile_dir = vim.fn.fnamemodify(makefile_dir, ":h")

      vim.fn.jobstart("make", {
        cwd = makefile_dir,
        on_exit = function(_, exit_code)
          vim.schedule(function()
            if exit_code == 0 then
              vim.notify("LaTeX compilation successful", vim.log.levels.INFO)
            else
              vim.notify("LaTeX compilation failed", vim.log.levels.ERROR)
            end
          end)
        end
      })
    else
      vim.notify("Makefile not found", vim.log.levels.WARN)
    end
  end,
})
