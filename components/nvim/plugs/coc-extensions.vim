let g:coc_global_extensions = [
      \'coc-clangd',
      \'coc-cmake', 
      \'coc-jedi', 
      \'coc-tsserver', 
      \'coc-rust-analyzer',
      \'coc-explorer', 
      \'coc-pairs', 
      \'coc-snippets', 
      \'coc-yaml'
\]
      "\'coc-prettier', 
"CocInstall coc-explorer
nmap <C-e> <Cmd>CocCommand explorer<CR>
