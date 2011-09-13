" BUNDLE: git://github.com/mileszs/ack.vim.git

" Use Ack instead of Grep when available
if executable("ack")
  set grepprg=ack\ -H\ --nogroup\ --nocolor
  nnoremap <leader>a :Ack -a 
  cabbrev ack Ack -a 
endif
