let g:eskk#large_dictionary = {'path': "~/.config/nvim/plugs/SKK-JISYO.M", 'sorted': 1, 'encoding': 'euc-jp',}
let g:eskk#kakutei_when_unique_candidate = 1 "漢字変換した時に候補が1つの場合、自動的に確定する
let g:eskk#enable_completion = 0             "neocompleteを入れないと、1にすると動作しなくなるため0推奨
let g:eskk#no_default_mappings = 1           "デフォルトのマッピングを削除
let g:eskk#keep_state = 0                    "ノーマルモードに戻るとeskkモードを初期値にする
let g:eskk#egg_like_newline = 1              "漢字変換を確定しても改行しない。

" the default triangle notation is not easy for us.
let g:eskk#marker_henkan = "[convrt]"
let g:eskk#marker_henkan_select = "[select]"
let g:eskk#marker_okuri = "[ruby]"
let g:eskk#marker_jisyo_touroku = "[dict]"
augroup vimrc_eskk
  autocmd!
  autocmd User eskk-enable-post lmap <buffer> l <Plug>(eskk:disable)
augroup END

imap jk <Plug>(eskk:toggle)
cmap jk <Plug>(eskk:toggle)

