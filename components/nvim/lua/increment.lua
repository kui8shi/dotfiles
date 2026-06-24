vim.keymap.set('n', 'g<C-a>',
  function()
    -- increment by 1 all numbers in the line
    vim.cmd([[silent! s/\d\+/\=submatch(0)+1/g]])
    vim.cmd([[nohlsearch]])
  end,
  {
    noremap = true,
    silent = true,
    desc = "Increment all numbers in current line"
  }
)

vim.keymap.set('n', 'g<C-x>',
  function()
    -- decrement by 1 all numbers in the line
    vim.cmd([[silent! s/\d\+/\=submatch(0)-1/g]])
    vim.cmd([[nohlsearch]])
  end,
  {
    noremap = true,
    silent = true,
    desc = "Increment all numbers in current line"
  }
)
