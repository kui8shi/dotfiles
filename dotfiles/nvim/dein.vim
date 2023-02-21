" ------------------------------------------------------------
"  dein setting
" ------------------------------------------------------------
set runtimepath+=$XDG_CACHE_HOME/dein/repos/github.com/Shougo/dein.vim

let s:dein_home_dir  = expand('$XDG_CACHE_HOME/dein')
let s:dein_repo_dir  = expand('$XDG_CACHE_HOME/dein/repos/github.com/Shougo/dein.vim')
let s:toml_file      = expand('$XDG_CONFIG_HOME/nvim/dein.toml')
let s:toml_lazy      = expand('$XDG_CONFIG_HOME/nvim/dein_lazy.toml')

"         if not there is dein.vim, then git clone
if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif

if &compatible
  set nocompatible
endif

"
"         load plugins and cache them
if dein#load_state(s:dein_home_dir)
  call dein#begin(s:dein_home_dir)
  call dein#load_toml(s:toml_file, {'lazy': 0})
  call dein#load_toml(s:toml_lazy, {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif
"         automatically install plugins
if has('vim_starting') && dein#check_install()
  call dein#install()
endif
"dein settings end

