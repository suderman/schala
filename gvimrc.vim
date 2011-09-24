if has("gui_macvim")

  " Enable option key
  set macmeta

  " MacVim shift+arrow-keys behavior
  let macvim_hig_shift_movement = 1

  " Only show MacVim right scrollbar
  set guioptions=r

  " Hide MacVim toolbar
  set guioptions-=T

  " GUI tabs
  set guioptions+=e

  " Autoselect
  " set guioptions+=a

  " Grey menu items
  set guioptions+=g

  map <D-]> :bnext<CR>
  map <D-[> :bprev<CR>

  " macmenu &File.New\ Tab key=<nop>
  " map <D-t> :PeepOpen<CR>

  " macmenu &File.New\ Window key=<nop>
  " macmenu File.New\ Window key=<D-N> action=newWindow:
  " map <D-N> :silent !mvim<CR>

  " macmenu &File.Open\ Tab\.\.\. key=<nop>
  " macmenu File.New\ Tab key=<D-T>
  " map <D-T> :tabnew<CR>

  " an 10.300 File.New\ Split :NewSplit <CR>
  " macm File.New\ Split key=<D-n>

  an 10.310 File.New\ File :NewFile <CR>
  macm File.New\ File key=<D-M-n>

  macmenu Edit.Find.Find\.\.\. key=<nop>
  map <D-f> /

  an 25 View.Show/Hide\ Project\ Drawer :NERDTreeToggle<CR>
  macm View.Show/Hide\ Project\ Drawer key=<D-d>

  an 30 View.Go\ To\ File :CommandT<CR>
  macmenu &Edit.Find.Find\ Next key=<nop>
  macmenu View.Go\ To\ File key=<D-g>

  an 30 View.Buffer\ List :Buffers<CR>
  macmenu &Tools.Make key=<nop>
  macmenu View.Buffer\ List key=<D-b>

  " an 10.300 File.Quit\ Buffer :Kwbd <CR>
  " macmenu MacVim.Quit\ MacVim key=<nop>
  " macmenu View.Buffer\ List key=<D-q>
endif
