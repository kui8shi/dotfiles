-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/kui8shi/.cache/nvim/packer_hererocks/2.1.1713773202/share/lua/5.1/?.lua;/home/kui8shi/.cache/nvim/packer_hererocks/2.1.1713773202/share/lua/5.1/?/init.lua;/home/kui8shi/.cache/nvim/packer_hererocks/2.1.1713773202/lib/luarocks/rocks-5.1/?.lua;/home/kui8shi/.cache/nvim/packer_hererocks/2.1.1713773202/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/kui8shi/.cache/nvim/packer_hererocks/2.1.1713773202/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["bufferline.nvim"] = {
    loaded = true,
    path = "/home/kui8shi/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/kui8shi/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/kui8shi/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/kui8shi/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["git-conflict.nvim"] = {
    loaded = true,
    path = "/home/kui8shi/.local/share/nvim/site/pack/packer/start/git-conflict.nvim",
    url = "https://github.com/akinsho/git-conflict.nvim"
  },
  ["iceberg.vim"] = {
    loaded = true,
    path = "/home/kui8shi/.local/share/nvim/site/pack/packer/start/iceberg.vim",
    url = "https://github.com/cocopon/iceberg.vim"
  },
  ["leap.nvim"] = {
    config = { "\27LJ\2\nA\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\25add_default_mappings\tleap\frequire\0" },
    loaded = true,
    path = "/home/kui8shi/.local/share/nvim/site/pack/packer/start/leap.nvim",
    url = "https://github.com/ggandor/leap.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/kui8shi/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/kui8shi/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/kui8shi/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/kui8shi/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/home/kui8shi/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/kui8shi/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/kui8shi/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-rooter.lua"] = {
    loaded = true,
    path = "/home/kui8shi/.local/share/nvim/site/pack/packer/start/nvim-rooter.lua",
    url = "https://github.com/notjedi/nvim-rooter.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\ng\0\0\2\0\6\0\t6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0K\0\1\0\31nvim_treesitter#foldexpr()\rfoldexpr\texpr\15foldmethod\bopt\bvimª\3\1\0\n\0\21\0\0316\0\0\0006\2\1\0'\3\2\0B\0\3\3\15\0\0\0X\2\24€9\2\3\0015\4\a\0005\5\4\0005\6\5\0=\6\6\5=\5\b\0045\5\t\0=\5\n\4B\2\2\0016\2\v\0009\2\f\0029\2\r\0025\4\14\0005\5\17\0006\6\v\0009\6\f\0069\6\15\6'\b\16\0004\t\0\0B\6\3\2=\6\18\0053\6\19\0=\6\20\5B\2\3\1K\0\1\0\rcallback\0\ngroup\1\0\2\rcallback\0\ngroup\0\23TS_FOLD_WORKAROUND\24nvim_create_augroup\1\6\0\0\rBufEnter\vBufAdd\vBufNew\15BufNewFile\16BufWinEnter\24nvim_create_autocmd\bapi\bvim\vindent\1\0\1\fenabled\2\14highlight\1\0\2\vindent\0\14highlight\0\fdisable\1\4\0\0\blua\ttoml\trust\1\0\2\fdisable\0\fenabled\2\nsetup\28nvim-treesitter.configs\frequire\npcall\0" },
    loaded = true,
    path = "/home/kui8shi/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/kui8shi/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/kui8shi/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/kui8shi/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  rnvimr = {
    loaded = true,
    path = "/home/kui8shi/.local/share/nvim/site/pack/packer/start/rnvimr",
    url = "https://github.com/kevinhwang91/rnvimr"
  },
  ["telescope-file-browser.nvim"] = {
    loaded = true,
    path = "/home/kui8shi/.local/share/nvim/site/pack/packer/start/telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/kui8shi/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/kui8shi/.local/share/nvim/site/pack/packer/start/vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\ng\0\0\2\0\6\0\t6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0K\0\1\0\31nvim_treesitter#foldexpr()\rfoldexpr\texpr\15foldmethod\bopt\bvimª\3\1\0\n\0\21\0\0316\0\0\0006\2\1\0'\3\2\0B\0\3\3\15\0\0\0X\2\24€9\2\3\0015\4\a\0005\5\4\0005\6\5\0=\6\6\5=\5\b\0045\5\t\0=\5\n\4B\2\2\0016\2\v\0009\2\f\0029\2\r\0025\4\14\0005\5\17\0006\6\v\0009\6\f\0069\6\15\6'\b\16\0004\t\0\0B\6\3\2=\6\18\0053\6\19\0=\6\20\5B\2\3\1K\0\1\0\rcallback\0\ngroup\1\0\2\rcallback\0\ngroup\0\23TS_FOLD_WORKAROUND\24nvim_create_augroup\1\6\0\0\rBufEnter\vBufAdd\vBufNew\15BufNewFile\16BufWinEnter\24nvim_create_autocmd\bapi\bvim\vindent\1\0\1\fenabled\2\14highlight\1\0\2\vindent\0\14highlight\0\fdisable\1\4\0\0\blua\ttoml\trust\1\0\2\fdisable\0\fenabled\2\nsetup\28nvim-treesitter.configs\frequire\npcall\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: leap.nvim
time([[Config for leap.nvim]], true)
try_loadstring("\27LJ\2\nA\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\25add_default_mappings\tleap\frequire\0", "config", "leap.nvim")
time([[Config for leap.nvim]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
