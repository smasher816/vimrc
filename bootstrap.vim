if empty($VIMHOME)
	let $VIMHOME=expand('<sfile>:p:h:h')
endif

function! bootstrap#init()
if !isdirectory(expand("$VIMHOME/undo"))
  silent !mkdir -p $VIMHOME/{undo,swp,backup}
endif

if empty(glob('$VIMHOME/autoload/plug.vim'))
  silent !curl -fLo $VIMHOME/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

if empty(glob('$VIMHOME/spell/*'))
  silent !curl -fLo $VIMHOME/spell/en.utf-8.spl --create-dirs
   \ http://ftp.vim.org/vim/runtime/spell/en.utf-8.spl
  silent !curl -fLo $VIMHOME/spell/en.utf-8.sug --create-dirs
   \ http://ftp.vim.org/vim/runtime/spell/en.utf-8.sug
endif

if plug#begin()
	Plug 'smasher816/vimrc'
	silent! source $VIMHOME/plugins.vim
	source $VIMHOME/plugged/vimrc/plugins.vim
call plug#end()

"load plugin now so vimrc still has a chance to override settings
call plug#load('vimrc')
let g:vimrc_loaded = 1
endif

endfunction
