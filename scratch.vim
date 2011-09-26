
" BUNDLE: git://github.com/timcharper/textile.vim.git
" BUNDLE: git://github.com/taq/vim-rspec.git
" BUNDLE: git://github.com/tpope/vim-cucumber.git
" BUNDLE: git://github.com/vim-scripts/taglist.vim.git
" BUNDLE: git://github.com/vim-scripts/DrawIt.git
" BUNDLE: git://github.com/suderman/vim-peepopen.git

" BUNDLE: git://github.com/nathanaelkane/vim-indent-guides.git
" Indent Guides
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

if has('gui_running')
  set background=dark
  " colorscheme solarized
  colorscheme ir_black
else
  set background=dark
  let g:solarized_termcolors=16
  " colorscheme solarized
  colorscheme ir_black
endif

" Toggle background with <F6>
function! ToggleBackground()
    if (w:solarized_style=="dark")
    let w:solarized_style="light"
    colorscheme solarized
else
    let w:solarized_style="dark"
    colorscheme solarized
endif
endfunction
command! Togbg call ToggleBackground()
nnoremap <F6> :call ToggleBackground()<CR>
inoremap <F6> <ESC>:call ToggleBackground()<CR>a
vnoremap <F6> <ESC>:call ToggleBackground()<CR>

" Fold with spacebar
nnoremap <space> za
vnoremap <space> zf

" BUNDLE: git://github.com/fholgado/minibufexpl.vim.git
" Focus MiniBufExplorer tabs and cycle with comma-tab (,Tab -> tab, tab, tab...)
nmap <leader><tab> :MiniBufExplorer<CR> <C-W>+ <C-W>-

nmap <Leader>t :TMiniBufExplorer<CR>
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplUseSingleClick = 1
" let g:miniBufExplShowBufNumbers = 0
let g:miniBufExplMaxSize = 1
let g:miniBufExplSplitBelow=1 | set laststatus=0

" CTags
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>

" BUNDLE: git://github.com/vim-scripts/searchfold.vim.git
" Folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

" Resize windows. Shift-[h,j,k,l] 
nmap <S-j> <C-W>+
nmap <S-k> <C-W>-
nmap <S-h> <C-W><
nmap <S-l> <C-W>>

" Seeing how I messed up my (J)oin command with resizing windows, use this
nmap ;j :join<CR>

" ,wq or ,qw to write and quit
nmap <leader>wq :wq<CR>
nmap <leader>qw :wq<CR>
map <C-s> :w ++enc=latin2<CR>


" ,q to quit (close window)
map <C-q> :Kwbd<CR>
nmap <leader>q :Kwbd<CR>
nmap <leader>qq :quitall<CR>


" Visual mode insert and after, make lower-case work
vmap i <S-i>
vmap a <S-a>

" BUNDLE: git://github.com/vim-scripts/bufkill.vim.git
nmap zx :BD<CR>
nmap zxx :bd!<CR>
nmap ZX :w<CR>:BD<CR>
nmap zsx :w<CR>:BD<CR>


" BUNDLE: git://github.com/vim-scripts/buftabs.git
let g:buftabs_in_statusline=1
let g:buftabs_only_basename=1
let g:buftabs_active_highlight_group="Visual"

