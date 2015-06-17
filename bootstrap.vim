function! bootstrap#init()
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

if plug#begin()
	silent! source ~/.nvim/plugins.vim
	Plug 'smasher816/vimrc'
	source ~/.nvim/plugged/vimrc/plugins.vim
call plug#end()
endif

endfunction
