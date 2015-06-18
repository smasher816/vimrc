if empty($VIMHOME)
	let $VIMHOME=expand('<sfile>:p:h:h')
endif

function! bootstrap#init()
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
	silent! source $VIMHOME/plugins.vim
	Plug 'smasher816/vimrc'
	source $VIMHOME/plugged/vimrc/plugins.vim
call plug#end()
endif

endfunction
