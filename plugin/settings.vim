if exists('g:vimrc_loaded')
	finish
endif

"make vim look nice
filetype plugin indent on
syntax on
if filereadable(expand("$VIMHOME/plugged/jellybeans.vim/colors/jellybeans.vim"))
  color jellybeans
endif

"load modeline options securely
set exrc
set secure

"tab settings
set shiftwidth=4
set tabstop=4
set smarttab

"indenting
set autoindent
set preserveindent
set copyindent

"searching
set ignorecase
set smartcase
set hlsearch
set incsearch

"show more information
set ruler
set showcmd
set showmode
set number

"enable extra term features
set mouse=a
set title
set lazyredraw

set virtualedit=block "block selection w/ <C-v>
set wildmenu "better tab completion
set autoread
set autowrite
set ttimeoutlen=10
set shortmess+=fmnrxI

set nojoinspaces
set showbreak=«
set cursorline
set whichwrap+=<,>,[,]
if v:version>=700
  set colorcolumn=100
endif

set linebreak
set textwidth=0
set scrolloff=3
set sidescrolloff=3

set foldenable
set foldmethod=indent
set foldlevelstart=99
set display+=lastline
set diffopt=iwhite

"save history
"and don't clutter working dir
set history=1024
set undolevels=1024
if has('persistent_undo')
  set backupdir=~/.vim/backup//,.
  set directory=~/.vim/swp//,.
  set undodir=~/.vim/undo//,.
  set undofile
endif

set iskeyword+=-
set mps+=<:>

set listchars=tab:➞\ ,trail:·,nbsp:·,precedes:«,extends:»,eol:↴
set nolist

set hidden
set splitbelow
set splitright
set switchbuf=useopen,usetab

set tags=tags;/

if !filereadable(expand("%:p:h")."/Makefile")
 setlocal makeprg=gcc\ -Wall\ -Wextra\ -o\ %<\ %
endif

set laststatus=2
