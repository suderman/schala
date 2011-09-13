" BUNDLE: git://github.com/vim-scripts/jade.vim.git
" BUNDLE: git://github.com/vim-scripts/jQuery.git
" BUNDLE: git://github.com/tpope/vim-haml.git
" BUNDLE: git://github.com/pangloss/vim-javascript.git
" BUNDLE: git://github.com/tpope/vim-markdown.git

" special filetype syntax coloring
au Bufread,BufNewFile {ssh-config} set ft=sshconfig
au Bufread,BufNewFile {.rvmrc,rvmrc} set ft=sh
au Bufread,BufNewFile {.gitconfig,gitconfig} set ft=gitconfig
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} set wrap | set wrapmargin=2 | set textwidth=72

" make python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python  set tabstop=4 textwidth=79

" BUNDLE: git://github.com/kchmck/vim-coffee-script.git
au BufWritePost *.coffee silent CoffeeMake! -b | cwindow | redraw!
au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable