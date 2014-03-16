runtime plugin/source.vim
syntax on
filetype plugin indent on

" Determine machine (alpha.mydevbox.com, beta.mydevbox.com, something.local)
let hostname = substitute(system('hostname'), '\n', '', '')

" Comma is the leader character
let mapleader = ","

" Basic stuff
set nocompatible                       " allow editor to be Vim instead of Vi
set mouse=a                            " allow the mouse to be used
set title                              " set the window's title to the current filename
set visualbell                         " no more beeping from Vim
set timeoutlen=500
set scrolloff=0
set history=1000
set number                             " show line numbers
set cursorline                         " highlight current line
set fillchars=vert:│                   " Solid line for vsplit separator

" Status Line
set laststatus=2                       " always show status line
set ruler
set showcmd                            " show command in bottom bar
set showmode                           " show what mode (Insert/Normal/Visual) is currently on

Source https://github.com/bling/vim-airline
let g:airline_left_sep='⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep='⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols = {}
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.linenr = '⭡'


" Wild stuff!
set wildmenu                           " visual autocomplete for command menu
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,*.pyc,*.rbc,*.class,.svn,test/fixtures/*,vendor/gems/*,*.DS_STORE,*.db,*.swc,*.tar,*.tgz,.git,*/public_html/images/**,*/public_html/upload/**,*/public/images/**,*/public/upload/**,./var/**,*/uploads/**,*/pear/**,*/build/**

" Encoding
set encoding=utf-8
" set bomb

" Whitespace
set nowrap
set tabstop=2                           " number of visual spaces per tab
set softtabstop=2                       " number of spaces in tab when editing
set expandtab                           " tabs are spaces!
set shiftwidth=2                        " how many spaces to indent/outdent
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
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-h> <Left>
imap <C-l> <Right>

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
vmap < <gv
vmap > >gv

" Better visual block selecting
set virtualedit+=block
set virtualedit+=insert
set virtualedit+=onemore

" Hide buffers or auto-save?
set hidden       " allow unsaved buffers to be hidden
set autoread      " Set to auto read when a file is changed from the outside
" set autowriteall  " Automatically save buffers

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set gdefault

" Clear search with comma-space
noremap <leader><space> :noh<CR>:match none<CR>:2match none<CR>:3match none<CR>

" F5 will remove trailing whitespace and tabs
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:retab<CR>

" Redraw shortcut
noremap <C-m> <Esc>:redraw!<CR>

" Opens an edit command with the path of the currently edited file filled in
map :ee :e <C-R>=expand("%:p:h") . "/" <CR>

" ;cd to current file
nnoremap ;cd :cd %:p:h<CR>:pwd<CR>

" Alt-tab between buffers
nnoremap <leader><leader> <c-^>
nmap <leader>6 <C-^>
nmap <leader>^ <C-^>

" When pasting from OS's clipboard, hit ,P command-v ,P
nnoremap <leader>p :set invpaste paste?<CR>
set pastetoggle=<leader>p

" Use OS X clipboard
set clipboard=unnamed

" Make 'Y' follow 'D' and 'C' conventions'
nnoremap Y y$

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

if executable("ag")
  command! SearchProject let q = input("Search within this project: ") | exe ":Ag -a ".q
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

" Ag - The Silver Searcher
Source https://github.com/rking/ag.vim

" Use Ag instead of Grep when available
if executable("ag")
  set grepprg=ag\ -H\ --nogroup\ --nocolor
  nnoremap <leader>a :Ag ""<left>
endif

"============="

Source https://github.com/vim-scripts/bufexplorer.zip

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
set t_Co=256

Source https://github.com/vim-scripts/ScrollColors
nmap ;cc :COLORSCROLL<CR>

Source https://github.com/bzx/vim-theme-pack

Source https://github.com/altercation/vim-colors-solarized
let g:solarized_contrast="high"
call togglebg#map(";b")

colorscheme desert256
set background=dark
nmap ;c :colorscheme 

"============="

" CtrlP
Source https://github.com/kien/ctrlp.vim

let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_map = ''
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$',
  \ 'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\',
  \ }
imap <C-g> <ESC>:CtrlP .<CR>
vmap <C-g> <ESC>:CtrlP .<CR>
nmap <C-g> <ESC>:CtrlP .<CR>

"============="

Source https://github.com/mattn/gist-vim

let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
if has("mac")
  let g:gist_clip_command = 'pbcopy'
elseif has("unix")
  let g:gist_clip_command = 'xclip -selection clipboard'
endif

"============="

Source https://github.com/sjl/gundo.vim

" ,u will show undo history graph
nnoremap <leader>u :GundoToggle<CR>
let g:gundo_right = 1

"============="

Source https://github.com/rgarver/Kwbd.vim

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
" nmap <Space> %
Source https://github.com/Valloric/MatchTagAlways.git

"============="

Source https://github.com/Lokaltog/vim-easymotion

let g:EasyMotion_leader_key = ';m'

" <leader>m to easy-motion entire screen. If cancelling,
" double tap `` to go back to previous cursor position
nmap <leader>m m`:normal! H<cr>;mw


"============="

Source https://github.com/vim-scripts/jade.vim
Source https://github.com/vim-scripts/jQuery
Source https://github.com/tpope/vim-haml
Source https://github.com/pangloss/vim-javascript
Source https://github.com/tpope/vim-markdown

Source https://github.com/othree/html5.vim
Source https://github.com/theprivileges/smarty.vim
au BufNewFile,BufReadPost *.html set ft=smarty

" special filetype syntax coloring
au Bufread,BufNewFile {ssh-config} set ft=sshconfig
au Bufread,BufNewFile {.rvmrc,rvmrc} set ft=sh
au Bufread,BufNewFile {.gitconfig,gitconfig} set ft=gitconfig
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,Capfile,config.ru} set ft=ruby
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} set wrap | set wrapmargin=2 | set textwidth=72

Source https://github.com/ervandew/supertab
highlight Pmenu ctermbg=238 gui=bold
" make python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python  set tabstop=4 textwidth=79

Source https://github.com/kchmck/vim-coffee-script
au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable | set ft=coffee

Source https://github.com/lchi/vim-toffee
au BufNewFile,BufReadPost *.toffee set ft=toffee

Source https://github.com/skammer/vim-css-color
Source https://github.com/hail2u/vim-css3-syntax
Source https://github.com/groenewege/vim-less
au BufNewFile,BufReadPost *.less set ft=less

Source https://github.com/vim-scripts/VimClojure

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

Source https://github.com/tpope/vim-unimpaired

" Bubble multiple lines
vmap _ [egv
vmap + ]egv

"============="

Source https://github.com/vim-scripts/YankRing.vim

nnoremap <silent> [p :YRShow<cr>
inoremap <silent> [p <ESC>:YRShow<cr>
let g:yankring_history_file = '.yankring_history'
let g:yankring_min_element_length = 2
let g:yankring_manual_clipboard_check = 1

"============="

Source https://github.com/vim-scripts/ZoomWin

map <Leader>z :ZoomWin<CR>

"============="

Source https://github.com/scrooloose/syntastic

let g:syntastic_enable_signs=1
let g:syntastic_quiet_messages = {'level': 'warnings'}

"============="

Source https://github.com/tpope/vim-rails
Source https://github.com/tsaleh/vim-shoulda

" Fancy rails/tmux tdd goodness
Source https://github.com/kikijump/tslime.vim
Source https://github.com/jgdavey/vim-turbux

"============="

" Auto-close parenthesis and quotes
Source https://github.com/Raimondi/delimitMate

"============="

Source https://github.com/tpope/vim-endwise
Source https://github.com/msanders/snipmate.vim
Source https://github.com/tomtom/tcomment_vim
Source https://github.com/tpope/vim-fugitive
Source https://github.com/tpope/vim-git
Source https://github.com/tpope/vim-surround
Source https://github.com/tpope/vim-unimpaired
Source https://github.com/tpope/vim-repeat
Source https://github.com/tsaleh/vim-align
Source https://github.com/vim-scripts/camelcasemotion
Source https://github.com/vim-scripts/IndexedSearch
Source https://github.com/airblade/vim-rooter
Source https://github.com/mortice/pbcopy.vim
Source https://github.com/tpope/vim-bundler

"============="

" Supertab and autocomplete
Source https://github.com/ervandew/supertab
let g:SuperTabDefaultCompletionType = "context"

"============="

" Omni completion popup menu
"Source https://github.com/spf13/PIV
"Source https://github.com/vim-scripts/rubycomplete.vim
highlight Pmenu ctermbg=238 gui=bold

"============="

Source https://github.com/scrooloose/nerdtree

" NERDTree toggles with ,d
map <Leader>d :NERDTreeToggle \| :silent NERDTreeMirror<CR>
map <Leader>dd :NERDTreeFind<CR>
let NERDTreeIgnore=['\.rbc$', '\~$']
let NERDTreeDirArrows=1
let NERDTreeMinimalUI=1
let NERDTreeShowHidden=1


