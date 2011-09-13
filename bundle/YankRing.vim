" BUNDLE: git://github.com/vim-scripts/YankRing.vim.git

nnoremap <silent> [p :YRShow<cr>
inoremap <silent> [p <ESC>:YRShow<cr>
let g:yankring_history_file = '.yankring_history'
