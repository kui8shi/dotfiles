".vimrc

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

" encode
set encoding=utf-8
scriptencoding utf-8

" undo
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

filetype plugin indent on
syntax enable
