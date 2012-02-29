runtime plugin/source.vim
syntax on
filetype plugin indent on

" Determine machine (fenring.nonfiction.ca, ginaz.nonfiction.ca, something.local)
let hostname = substitute(system('hostname'), '\n', '', '')

" Comma is the leader character
let mapleader = ","

" Basic stuff
set nocompatible
set mouse=a
set hidden
set title
set visualbell
set timeoutlen=500
set scrolloff=0
set history=1000

" Status bar
set number
set ruler
set showcmd
set showmode
set laststatus=2

" Wild stuff!
set wildmenu
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,*.pyc,*.rbc,*.class,.svn,test/fixtures/*,vendor/gems/*,*.DS_STORE,*.db,*.swc,*.tar,*.tgz,.git,public_html/images/**,public_html/upload/**,var/**,*/uploads/**,*/pear/**

" Encoding
" set bomb
" set encoding=utf-8

" Whitespace
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:\ \ ,trail:·
set backspace=indent,eol,start

" Use modeline overrides
set modeline
set modelines=10

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup
set nobackup
set nowritebackup

" Remember last location in file
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

" Visually select the text that was last edited/pasted
nmap gV `[v`]

" Let split windows be different sizes
set noequalalways

" Split shortcuts
nmap <leader>- :sp<CR>
nmap <leader>= :vs<CR>
nmap <leader>c :close<CR>
nmap <leader>cc :tabclose<CR>

" Smart way to move between windows. Ctrl-[h,j,k,l]
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

" If in Visual Mode, resize window instead of changing focus. Ctrl-[h,j,k,l]
vmap <C-j> <C-W>+
vmap <C-k> <C-W>-
vmap <C-h> <C-W><
vmap <C-l> <C-W>>

" Let directional keys work in Insert Mode. Ctrl-[h,j,k,l]
imap <C-j> <Esc>ja
imap <C-k> <Esc>ka
imap <C-h> <Esc>ha
imap <C-l> <Esc>la

" Cursor movement in command mode
cmap <C-j> <Down>
cmap <C-k> <Up>
cmap <C-h> <Left>
cmap <C-l> <Right>
cmap <C-x> <Del>
cmap <C-z> <BS>
cmap <C-v> <C-R>"

" 0 is beginning of line, so make - the end of the line
nmap - $

" Visual shifting (builtin-repeat)
vmap <S-Tab> <gv
vmap <Tab> >gv

" Better visual block selecting
set virtualedit+=block

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set gdefault

" Open a Quickfix window for the last search.
nnoremap <silent> <leader>/ :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" Ack for the last search.
nnoremap <silent> <leader>? :execute "Ack! '" . substitute(substitute(substitute(@/, "\\\\<", "\\\\b", ""), "\\\\>", "\\\\b", ""), "\\\\v", "", "") . "'"<CR>

" Clear search with comma-space
noremap <leader><space> :noh<CR>:match none<CR>:2match none<CR>:3match none<CR>

" Quit
nmap <leader>q :q<CR>
nmap <leader>qq :q!<CR>
nmap <leader>qqq :qa!<CR>

nmap <S-h> :tabprevious<CR>
nmap <S-l> :tabnext<CR>
nmap < :tabprevious<CR>
nmap > :tabnext<CR>

nmap <leader>t :tabnew<CR>
nmap ;t :tab ball<CR>
set tabpagemax=50

" Toggle between modes with <Ctrl-a>
nnoremap <C-a> :
cnoremap <C-a> <Esc>
inoremap <C-a> <Esc>
vnoremap <C-a> <Esc>

" F5 will remove trailing whitespace and tabs
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:retab<CR>

" Opens an edit command with the path of the currently edited file filled in
map :ee :e <C-R>=expand("%:p:h") . "/" <CR>

" ;cd to current file
nnoremap ;cd :cd %:p:h<CR>:pwd<CR>

" Alt-tab between buffers
nnoremap <leader><leader> <c-^>
nmap <leader>6 <C-^>
nmap <leader>^ <C-^>
map <M-tab>: <C-^>

" When pasting from OS's clipboard, hit ,P command-v ,P
nnoremap <leader>p :set invpaste paste?<CR>
set pastetoggle=<leader>p

" Use OS X clipboard
set clipboard=unnamed

" Make 'Y' follow 'D' and 'C' conventions'
nnoremap Y y$

" u is undo, so make shift-u redo (don't need 'undo line' anyway...)
nmap <S-U> <C-R>

" sudo & write if you forget to sudo first
cmap w!! w !sudo tee % >/dev/null

" Launch vimrc with ,v
nmap <leader>v :EditVimRC<CR>
command! EditVimRC call s:EditVimRC()
function! s:EditVimRC()
  let l:title = expand("%:t")
  if (l:title == '.vimrc')
    :edit ~/.gvimrc
  else
    :edit ~/.vimrc
  endif
endfunction




"============="

command! SearchFile let q = input("Search within this file: ") | exe "/".q."/"

command! SearchReplace let q = input("Search within this file: ") | let r = input("...and replace with this: ") | exe ":%s/".q."/".r."/g"
nmap <leader>r :SearchReplace<CR>

command! SearchReplaceLast let r = input("Replace last search with this: ") | exe ":%s//".r."/g"
nmap <leader>rr :SearchReplaceLast<CR>

if executable("ack")
  command! SearchProject let q = input("Search within this project: ") | exe ":Ack -a ".q
endif

"============="

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<CR>

" Move to the next misspelled word
map <leader>sn ]s

" Move to the previous misspelled word
map <leader>sp [s

" Add word to dictionary
map <leader>sa zg

" View spelling suggestions for misspelled word
map <leader>s? z=

"============="

Source git://github.com/mileszs/ack.vim.git

" Use Ack instead of Grep when available
if executable("ack")
  set grepprg=ack\ -H\ --nogroup\ --nocolor
  nnoremap <leader>a :Ack -a ""<left>
  cabbrev ack Ack -a ""<left>
endif

"============="

Source git://github.com/vim-scripts/bufexplorer.zip.git

command! Buffers call s:Buffers()
function! s:Buffers()
  let l:title = expand("%:t")
  if (l:title == '[BufExplorer]')
    :b#
  else
    :silent BufExplorer
  endif
endfunction

nmap <S-k> :Buffers<CR>

"============="

" Source git://github.com/godlygeek/csapprox.git

Source git://github.com/vim-scripts/ScrollColors.git
nmap ;cc :COLORSCROLL<CR>

Source git://github.com/bzx/vim-theme-pack.git

Source git://github.com/altercation/vim-colors-solarized.git
let g:solarized_contrast="high"
call togglebg#map(";b")

colorscheme lucius
set background=dark
nmap ;c :colorscheme 

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

" CtrlP - possible Command-T replacement?
Source git://github.com/kien/ctrlp.vim.git
let g:ctrlp_map = ''
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$',
  \ 'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\',
  \ }
imap <C-g> <ESC>:CtrlP .<CR>
vmap <C-g> <ESC>:CtrlP .<CR>
nmap <C-g> <ESC>:CtrlP .<CR>

"============="

Source git://github.com/mattn/gist-vim.git

let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
if has("mac")
  let g:gist_clip_command = 'pbcopy'
elseif has("unix")
  let g:gist_clip_command = 'xclip -selection clipboard'
endif

"============="

Source git://github.com/roman/golden-ratio.git

let g:golden_ratio_autocommand = 0
nmap ;r :GoldenRatioToggle<CR>

"============="

Source git://github.com/sjl/gundo.vim.git

" ,u will show undo history graph
nnoremap <leader>u :GundoToggle<CR>
let g:gundo_right = 1

"============="

Source git://github.com/robgleeson/hammer.vim.git

"============="

Source git://github.com/rgarver/Kwbd.vim.git

" :bd deletes a buffer, :BD deletes a buffer and keeps its window
command! BD Kwbd

" Don't save, close buffer, keep window
nmap ZX :BD<CR>

" Don't save, close buffer, close window
nmap ZXX :bd!<CR>

" Save, close buffer, keep window
nmap ZSX :w<CR>:BD<CR>

" Save, close buffer, close window
nmap ZSXX :w<CR>:bd!<CR>

" Save the buffer
nmap ZS :w<CR>
nmap <leader>w :w<CR>

"============="

runtime! macros/matchit.vim
nmap <Space> %

"============="

Source git://github.com/Lokaltog/vim-easymotion.git

let g:EasyMotion_leader_key = ';m'

" <leader>m to easy-motion entire screen. If cancelling,
" double tap `` to go back to previous cursor position
nmap <leader>m m`:normal! H<cr>;mw

"============="

Source git://github.com/vim-scripts/jade.vim.git
Source git://github.com/vim-scripts/jQuery.git
Source git://github.com/tpope/vim-haml.git
Source git://github.com/pangloss/vim-javascript.git
Source git://github.com/tpope/vim-markdown.git

" special filetype syntax coloring
au Bufread,BufNewFile {ssh-config} set ft=sshconfig
au Bufread,BufNewFile {.rvmrc,rvmrc} set ft=sh
au Bufread,BufNewFile {.gitconfig,gitconfig} set ft=gitconfig
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,Capfile,config.ru} set ft=ruby
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} set wrap | set wrapmargin=2 | set textwidth=72

" make python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python  set tabstop=4 textwidth=79

Source git://github.com/kchmck/vim-coffee-script.git
au BufWritePost *.coffee silent CoffeeMake! -b | cwindow | redraw!
au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable

nmap _js :setfiletype javascript<CR>
nmap _rb :setfiletype ruby<CR>
nmap _vi :setfiletype vim<CR>
nmap _ph :setfiletype php<CR>
nmap _sh :setfiletype sh<CR>
nmap _cs :setfiletype css<CR>
nmap _co :setfiletype coffee<CR>
nmap _sm :setfiletype smarty<CR>
nmap _md :setfiletype markdown<CR>
nmap _hm :setfiletype haml<CR>

"============="

Source git://github.com/tpope/vim-unimpaired.git

" Bubble multiple lines
vmap _ [egv
vmap + ]egv

"============="

Source git://github.com/vim-scripts/YankRing.vim.git

nnoremap <silent> [p :YRShow<cr>
inoremap <silent> [p <ESC>:YRShow<cr>
let g:yankring_history_file = '.yankring_history'

"============="

Source git://github.com/vim-scripts/ZoomWin.git

map <Leader>z :ZoomWin<CR>

"============="

Source git://github.com/scrooloose/syntastic.git

let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

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

Source git://github.com/tpope/vim-rails.git
Source git://github.com/tsaleh/vim-shoulda.git

"============="

Source git://github.com/tomtom/tcomment_vim.git
Source git://github.com/ervandew/supertab.git
Source git://github.com/msanders/snipmate.vim.git
Source git://github.com/Raimondi/delimitMate.git
Source git://github.com/tpope/vim-fugitive.git
Source git://github.com/tpope/vim-git.git
Source git://github.com/tpope/vim-surround.git
Source git://github.com/tpope/vim-unimpaired.git
Source git://github.com/tpope/vim-endwise.git
Source git://github.com/tpope/vim-repeat.git
Source git://github.com/tsaleh/vim-align.git
Source git://github.com/vim-scripts/camelcasemotion.git
Source git://github.com/vim-scripts/IndexedSearch.git
Source git://github.com/vim-scripts/closetag.vim.git
Source git://github.com/airblade/vim-rooter.git
Source git://github.com/mortice/pbcopy.vim.git
Source git://github.com/rygwdn/vim-conque.git
Source git://github.com/tpope/vim-commentary.git
Source git://github.com/tpope/vim-rvm.git
Source git://github.com/tpope/vim-bundler.git
Source git://github.com/chrisbra/NrrwRgn.git
Source git://github.com/jeetsukumaran/vim-buffergator.git

"============="

Source git://github.com/scrooloose/nerdtree.git

" NERDTree toggles with ,d
map <Leader>d :NERDTreeToggle \| :silent NERDTreeMirror<CR>
map <Leader>dd :NERDTreeFind<CR>
let NERDTreeIgnore=['\.rbc$', '\~$']
let NERDTreeDirArrows=1
let NERDTreeMinimalUI=1
let NERDTreeShowHidden=1



"======="

" Fancy status bar I found someplace
" Source https://gist.github.com/1229444

" Scrooloose Statusline
Source https://gist.github.com/1243665
