local util = {}

util.map = function(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- check if the file exists at the given path
util.isInstalled = function(path)
  -- empty(...) == 1 means there isn't the path.
  return vim.fn.empty(vim.fn.glob(path)) == 0 and 1 or 0
end

util.safe_require = function(mod, config)
  local status, mod = pcall(require, mod)
  if status then
    mod.setup(config)
  end
end
return util
