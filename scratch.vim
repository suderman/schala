
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


"============="

Source git://git.wincent.com/command-t.git /usr/bin/rake make

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

"============="

Source git://github.com/godlygeek/csapprox.git

"============="

Source git://github.com/sophacles/vim-bundle-sparkup.git

" Location of the sparkup executable. Seems to finding it in the same dir as the vim script.
let g:sparkup = 'sparkup'

" Additional args passed to sparkup.
let g:sparkupArgs = '--no-last-newline'

" Mapping used to execute sparkup.
let g:sparkupExecuteMapping = '<c-e>'

" Mapping used to jump to the next empty tag/attribute (leaving this as <c-n> breaks tab-completion)
let g:sparkupNextMapping = '<c-x>'

"============="

" Quit
nmap <leader>q :q<CR>
nmap <leader>qq :q!<CR>
nmap <leader>qqq :qa!<CR>

"============="

Source git://github.com/robgleeson/hammer.vim.git
Source https://github.com/rygwdn/vim-conque
Source https://github.com/vim-scripts/closetag.vim
Source https://github.com/tpope/vim-commentary
Source https://github.com/tpope/vim-rvm
Source https://github.com/jeetsukumaran/vim-buffergator
Source https://github.com/chrisbra/NrrwRgn

"============="
