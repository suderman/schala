" BUNDLE: git://git.wincent.com/command-t.git
" BUNDLE-COMMAND: if which rvm >/dev/null 2>&1; then rvm system exec rake make; else rake make; fi

" Command-T works with ,g --> [G]o-To-File
let g:CommandTMaxHeight=20
let g:CommandTCancelMap = ['<C-c>', '<Esc>']
map <Leader>g :CommandTFlush<CR>\|:CommandT<CR>
map <leader>gf :CommandTFlush<cr>\|:CommandT %%<cr>

" Rails navigation
map <leader>gv :CommandTFlush<cr>\|:CommandT app/views<cr>
map <leader>gc :CommandTFlush<cr>\|:CommandT app/controllers<cr>
map <leader>gm :CommandTFlush<cr>\|:CommandT app/models<cr>
map <leader>gh :CommandTFlush<cr>\|:CommandT app/helpers<cr>
map <leader>gl :CommandTFlush<cr>\|:CommandT lib<cr>
map <leader>gp :CommandTFlush<cr>\|:CommandT public<cr>
map <leader>gs :CommandTFlush<cr>\|:CommandT public/stylesheets<cr>
map <leader>gj :CommandTFlush<cr>\|:CommandT public/javascripts<cr>
