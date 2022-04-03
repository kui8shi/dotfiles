"init.vim

" ------------------------------------------------------------
"  key BIND
" ------------------------------------------------------------

" Normal Mode
cnoremap init :<C-u>edit $XDG_CONFIG_HOME/nvim/init.vim<CR>
noremap <Space>s :source $XDG_CONFIG_HOME/nvim/init.vim<CR>
noremap <Space>w :<C-u>w<CR>
    "^M is <S-CR> or <C-CR>. but it depends on your system.
    "please check with ctrl+v in insert mode.
noremap  :<C-u>call append(expand('.'), '')<CR>j

" Insert Mode
inoremap <silent> jj <ESC>:<C-u>w<CR>
" Insert Mode movekey bind
inoremap <C-d> <BS>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-k> <Up>
inoremap <C-j> <Down>


" ------------------------------------------------------------
" editor setting
" ------------------------------------------------------------

" encode settings
set encoding=utf-8
scriptencoding utf-8
" editor settings
if has('persistent_undo')
    set undodir=~/.cache/undo
    set undofile
endif
set number             "show line numbers
set autoindent         "auto indent when newline
set smartindent
set splitright         "split screen to the right
set splitbelow         "split screen to the below
set clipboard=unnamed  "copy yank on clipboard
set hls                "highlight searched words
set scrolloff=999
set showmatch          "closing parenthesis, show correspond one for a moment
set smartcase
set nobackup           "or you can set backupdir where backup files are saved
" tab settings
set shiftwidth=4       "num of spaces when auto indent
set expandtab          "tab input is spaces
" unvalid characters settings
set list
set listchars=tab:>-,trail:.
" persistent undo
if has("persistent_undo")
    set undodir=~/.undodir
    set undofile
endif

"set guicursor+=n:ver10

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

filetype plugin indent on
syntax enable

"dein settings end
