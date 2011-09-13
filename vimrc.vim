set nocompatible
set mouse=a

" Determine machine (fenring.nonfiction.ca, ginaz.nonfiction.ca, something.local)
let hostname = substitute(system('hostname'), '\n', '', '')

" Comma is the leader character
let mapleader = ","

" Basic stuff
syntax on
set hidden
set title
set visualbell
set timeoutlen=500
set scrolloff=0

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
set bomb
set encoding=utf-8

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

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Clear search with comma-space
nnoremap <leader><space> :noh<cr>

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

" Quick access to command mode
map ;; :

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

" u is undo, so make shift-u redo (don't need 'undo line' anyway...)
nmap U <C-R>


" Launch vimrc with ,v
nmap <leader>v :EditVimRC<CR>
command! EditVimRC call s:EditVimRC()
function! s:EditVimRC()
  let l:title = expand("%:t")
  if (l:title == 'vimrc.vim')
    :edit ~/.vim/current/gvimrc.vim
  else
    :edit ~/.vim/current/vimrc.vim
  endif
endfunction
