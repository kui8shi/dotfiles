"init.vim
-
" ------------------------------------------------------------
"  key BIND
" ------------------------------------------------------------

" Normal Mode
  "^M is <S-CR> or <C-CR>. but it depends on your system.
  "please check with ctrl+v in insert mode.
noremap  :<C-u>call append(expand('.'), '')<CR>j

" Insert Mode
inoremap <silent> jj <Esc>
" Insert Mode movekey bind
inoremap <C-d> <BS>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-k> <Up>
inoremap <C-j> <Down>
"nnoremap <C-h> :<C-u>help<space>
nnoremap <C-h> :bp<Cr>
nnoremap <C-l> :bn<Cr>
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
function! ClearUndo() abort
    if input("Clear ALL undo history? Type \"YES\" to continue: ") != "YES"
        return
    endif
    let undolevels_bak = &undolevels
    let modified_bak = &modified
    let &undolevels = -1
    exe "normal! a \<BS>\<Esc>"
    let &undolevels = undolevels_bak
    let &modified = modified_bak
    unlet l:undolevels_bak
endfunction

set number             "show line numbers
set autoindent         "auto indent when newline
set smartindent
set splitright         "split screen to the right
set splitbelow         "split screen to the below
set clipboard=unnamed  "copy yank on clipboard
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

"load completion settings
source $XDG_CONFIG_HOME/nvim/completion.vim

"load dein settings
source $XDG_CONFIG_HOME/nvim/dein.vim

" ------------------------------------------------------------
" visual
" ------------------------------------------------------------
set pumheight=10
set termguicolors
set cursorline
colorscheme iceberg


filetype plugin indent on
syntax enable
