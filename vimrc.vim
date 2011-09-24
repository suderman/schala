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

Source git://git.wincent.com/command-t.git if which rvm >/dev/null 2>&1; then rvm system exec rake make; else rake make; fi

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
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} set wrap | set wrapmargin=2 | set textwidth=72

" make python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python  set tabstop=4 textwidth=79

Source git://github.com/kchmck/vim-coffee-script.git
au BufWritePost *.coffee silent CoffeeMake! -b | cwindow | redraw!
au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable

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

"============="

Source git://github.com/scrooloose/nerdtree.git

" NERDTree toggles with ,d
map <Leader>d :NERDTreeToggle<CR>
map <Leader>dd :NERDTreeFind<CR>
let NERDTreeIgnore=['\.rbc$', '\~$']
let NERDTreeDirArrows=1
let NERDTreeMinimalUI=1
let NERDTreeShowHidden=1



"======="

" Statusline {{{
	" Functions {{{
		" Statusline updater {{{
			" Inspired by StatusLineHighlight by Ingo Karkat
			function! s:StatusLine(new_stl, type, current)
				let current = (a:current ? "" : "NC")
				let type = a:type
				let new_stl = a:new_stl

				" Prepare current buffer specific text
				" Syntax: <CUR> ... </CUR>
				let new_stl = substitute(new_stl, '<CUR>\(.\{-,}\)</CUR>', (a:current ? '\1' : ''), 'g')

				" Prepare statusline colors
				" Syntax: #[ ... ]
				let new_stl = substitute(new_stl, '#\[\(\w\+\)\]', '%#StatusLine'.type.'\1'.current.'#', 'g')

				if &l:statusline ==# new_stl
					" Statusline already set, nothing to do
					return
				endif

				if empty(&l:statusline)
					" No statusline is set, use my_stl
					let &l:statusline = new_stl
				else
					" Check if a custom statusline is set
					let plain_stl = substitute(&l:statusline, '%#StatusLine\w\+#', '', 'g')

					if &l:statusline ==# plain_stl
						" A custom statusline is set, don't modify
						return
					endif

					" No custom statusline is set, use my_stl
					let &l:statusline = new_stl
				endif
			endfunction
		" }}}
		" Color dict parser {{{
			function! s:StatusLineColors(colors)
				for type in keys(a:colors)
					for name in keys(a:colors[type])
						let colors = {'c': a:colors[type][name][0], 'nc': a:colors[type][name][1]}
						let type = (type == 'NONE' ? '' : type)
						let name = (name == 'NONE' ? '' : name)

						if exists("colors['c'][0]")
							exec 'hi StatusLine'.type.name.' ctermbg='.colors['c'][0].' ctermfg='.colors['c'][1].' cterm='.colors['c'][2]
						endif

						if exists("colors['nc'][0]")
							exec 'hi StatusLine'.type.name.'NC ctermbg='.colors['nc'][0].' ctermfg='.colors['nc'][1].' cterm='.colors['nc'][2]
						endif
					endfor
				endfor
			endfunction
		" }}}
	" }}}
	" Default statusline {{{
		let g:default_stl  = ""
		let g:default_stl .= "<CUR>#[Mode] %{&paste ? 'PASTE  ' : ''}%{substitute(mode(), '', '', 'g')} #[ModeS]</CUR>"
		let g:default_stl .= "#[ModFlag]%{&readonly ? 'RO ' : ''}" " RO flag
		let g:default_stl .= " #[FileName]%t " " File name
		let g:default_stl .= "#[ModFlag]%(%M %)" " Modified flag
		let g:default_stl .= "#[BufFlag]%(%H%W %)" " HLP,PRV flags
		let g:default_stl .= "#[FileNameS] " " Separator
		let g:default_stl .= "#[FunctionName] " " Padding/HL group
		let g:default_stl .= "%<" " Truncate right
		let g:default_stl .= "%= " " Right align
		let g:default_stl .= "<CUR>#[FileFormat]%{&fileformat} </CUR>" " File format
		let g:default_stl .= "<CUR>#[FileEncoding]%{(&fenc == '' ? &enc : &fenc)} </CUR>" " File encoding
		let g:default_stl .= "<CUR>#[Separator]  ⊂ #[FileType]%{strlen(&ft) ? &ft : 'n/a'} </CUR>" " File type
		let g:default_stl .= "#[LinePercentS] #[LinePercent] %p%% " " Line/column/virtual column, Line percentage
		let g:default_stl .= "#[LineNumberS] #[LineNumber]  %l#[LineColumn]:%c%V " " Line/column/virtual column, Line percentage
		let g:default_stl .= "%{exists('g:synid') && g:synid ? ' '.synIDattr(synID(line('.'), col('.'), 1), 'name').' ' : ''}" " Current syntax group
	" }}}
	" Color dict {{{
		let s:statuscolors = {
			\   'NONE': {
				\   'NONE'         : [[ 236, 231, 'bold'], [ 232, 244, 'none']]
			\ }
			\ , 'Normal': {
				\   'Mode'         : [[ 214, 235, 'bold'], [                 ]]
				\ , 'ModeS'        : [[ 214, 240, 'bold'], [                 ]]
				\ , 'Branch'       : [[ 240, 250, 'none'], [ 234, 239, 'none']]
				\ , 'BranchS'      : [[ 240, 246, 'none'], [ 234, 239, 'none']]
				\ , 'FileName'     : [[ 240, 231, 'bold'], [ 234, 244, 'none']]
				\ , 'FileNameS'    : [[ 240, 236, 'bold'], [ 234, 232, 'none']]
				\ , 'Error'        : [[ 240, 202, 'bold'], [ 234, 239, 'none']]
				\ , 'ModFlag'      : [[ 240, 196, 'bold'], [ 234, 239, 'none']]
				\ , 'BufFlag'      : [[ 240, 250, 'none'], [ 234, 239, 'none']]
				\ , 'FunctionName' : [[ 236, 247, 'none'], [ 232, 239, 'none']]
				\ , 'FileFormat'   : [[ 236, 244, 'none'], [ 232, 239, 'none']]
				\ , 'FileEncoding' : [[ 236, 244, 'none'], [ 232, 239, 'none']]
				\ , 'Separator'    : [[ 236, 242, 'none'], [ 232, 239, 'none']]
				\ , 'FileType'     : [[ 236, 248, 'none'], [ 232, 239, 'none']]
				\ , 'LinePercentS' : [[ 240, 236, 'none'], [ 234, 232, 'none']]
				\ , 'LinePercent'  : [[ 240, 250, 'none'], [ 234, 239, 'none']]
				\ , 'LineNumberS'  : [[ 252, 240, 'bold'], [ 234, 234, 'none']]
				\ , 'LineNumber'   : [[ 252, 236, 'bold'], [ 234, 244, 'none']]
				\ , 'LineColumn'   : [[ 252, 240, 'none'], [ 234, 239, 'none']]
			\ }
			\ , 'Insert': {
				\   'Mode'         : [[ 153,  23, 'bold'], [                 ]]
				\ , 'ModeS'        : [[ 153,  31, 'bold'], [                 ]]
				\ , 'Branch'       : [[  31, 117, 'none'], [                 ]]
				\ , 'BranchS'      : [[  31, 117, 'none'], [                 ]]
				\ , 'FileName'     : [[  31, 231, 'bold'], [                 ]]
				\ , 'FileNameS'    : [[  31,  24, 'bold'], [                 ]]
				\ , 'Error'        : [[  31, 202, 'bold'], [                 ]]
				\ , 'ModFlag'      : [[  31, 196, 'bold'], [                 ]]
				\ , 'BufFlag'      : [[  31,  75, 'none'], [                 ]]
				\ , 'FunctionName' : [[  24, 117, 'none'], [                 ]]
				\ , 'FileFormat'   : [[  24,  75, 'none'], [                 ]]
				\ , 'FileEncoding' : [[  24,  75, 'none'], [                 ]]
				\ , 'Separator'    : [[  24,  37, 'none'], [                 ]]
				\ , 'FileType'     : [[  24,  81, 'none'], [                 ]]
				\ , 'LinePercentS' : [[  31,  24, 'none'], [                 ]]
				\ , 'LinePercent'  : [[  31, 117, 'none'], [                 ]]
				\ , 'LineNumberS'  : [[ 117,  31, 'bold'], [                 ]]
				\ , 'LineNumber'   : [[ 117,  23, 'bold'], [                 ]]
				\ , 'LineColumn'   : [[ 117,  31, 'none'], [                 ]]
			\ }
		\ }
	" }}}
" }}}

" Statusline highlighting {{{
augroup StatusLineHighlight
	autocmd!
	let s:round_stl = 0
	au ColorScheme * call <SID>StatusLineColors(s:statuscolors)
	au BufEnter,BufWinEnter,WinEnter,CmdwinEnter,CursorHold,BufWritePost,InsertLeave * call <SID>StatusLine((exists('b:stl') ? b:stl : g:default_stl), 'Normal', 1)
	au BufLeave,BufWinLeave,WinLeave,CmdwinLeave * call <SID>StatusLine((exists('b:stl') ? b:stl : g:default_stl), 'Normal', 0)
	au InsertEnter,CursorHoldI * call <SID>StatusLine((exists('b:stl') ? b:stl : g:default_stl), 'Insert', 1)
augroup END
" }}}

augroup General " {{{
	autocmd!
	" Help file settings {{{
		function! s:SetupHelpWindow()
			wincmd L
			vertical resize 80
			setl nonumber winfixwidth colorcolumn=
			let b:stl = "#[Branch] HELP#[BranchS] [>] #[FileName]%<%t #[FileNameS][>>]%* %=#[LinePercentS][<<]#[LinePercent] %p%% " " Set custom statusline
			nnoremap <buffer> <Space> <C-]> " Space selects subject
			nnoremap <buffer> <BS>    <C-T> " Backspace to go back
		endfunction
		au FileType help au BufEnter,BufWinEnter <buffer> call <SID>SetupHelpWindow()
	" }}}
augroup END " }}}
