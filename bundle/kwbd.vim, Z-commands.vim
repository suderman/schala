" BUNDLE: git://github.com/rgarver/Kwbd.vim.git

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
