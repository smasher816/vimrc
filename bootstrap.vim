if empty($VIMHOME)
	let $VIMHOME=expand('<sfile>:p:h:h')
endif

function! bootstrap#init()
if empty(glob('$VIMHOME/autoload/plug.vim'))
  silent !curl -fLo $VIMHOME/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

if plug#begin()
	silent! source $VIMHOME/plugins.vim
	Plug 'smasher816/vimrc'
	source $VIMHOME/plugged/vimrc/plugins.vim
call plug#end()
endif

endfunction
