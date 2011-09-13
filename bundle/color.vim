colorscheme lucius
set background=dark

nmap ;c :colorscheme 

" BUUNDLE: git://github.com/godlygeek/csapprox.git

" BUNDLE: git://github.com/vim-scripts/ScrollColors.git
nmap ;cc :COLORSCROLL<CR>

" BUNDLE: git://github.com/bzx/vim-theme-pack.git

" BUNDLE: git://github.com/altercation/vim-colors-solarized.git
let g:solarized_contrast="high"
call togglebg#map(";b")
