if exists('g:vimrc_loaded')
	finish
endif

let mapleader=" "
nnoremap <leader>e :CtrlP<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>W :W<CR>
vmap <leader>y "*y
vmap <leader>Y "+y
vmap <leader>d "+d
vmap <leader>p "*p
vmap <leader>P "+p
nmap <leader>p "*p
nmap <leader>P "+p
nmap <leader>yy "*yy
nmap <leader>dd "*dd
nnoremap <leader>s :setlocal spell!<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>h :A<CR>
nnoremap <leader>o o<ESC>
nnoremap <leader>O O<ESC>
nnoremap <leader>c za
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'
nnoremap Y y$
nnoremap <del> "_x

nnoremap gs :%s!!!gn<Left><Left><Left>
map ZA :qa
vnoremap <S-Down> :m '>+1<CR>gv=gv
vnoremap <S-Up> :m '<-2<CR>gv=gv

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

noremap  <buffer> <silent> <Up>   gk
noremap  <buffer> <silent> <Down> gj
noremap  <buffer> <silent> <Home> g<Home>
noremap  <buffer> <silent> <End>  g<End>
inoremap <buffer> <silent> <Up>   <C-o>gk
inoremap <buffer> <silent> <Down> <C-o>gj
inoremap <buffer> <silent> <Home> <C-o>g<Home>
inoremap <buffer> <silent> <End>  <C-o>g<End>
nmap <C-o> o<ESC>k
nmap <C-O> O<ESC>j
nnoremap ; :
nnoremap : ;

map <silent> <A-Left> <C-w>>
map <silent> <A-Down> <C-W>-
map <silent> <A-Up> <C-W>+
map <silent> <A-Right> <C-w><
nnoremap <leader>h <C-w>v
nnoremap <leader>v <C-w>s

noremap <F10> :set wrap! <Bar> set wrap? <CR>
noremap <silent> <F11> :silent! cc<CR>:silent! cp <CR>
noremap <silent> <F12> :silent! cc<CR>:silent! cn <CR>
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> P P`]

nnoremap <silent> <Leader>/ :set hlsearch!<CR>
nn <silent> <Leader>. :set nolist!<cr>

inoremap <C-s> <C-o>:w<CR>

nnoremap <C-Left> <C-w>h
nnoremap <C-Down> <C-w>j
nnoremap <C-Up> <C-w>k
nnoremap <C-Right> <C-w>l
nnoremap <C-S-Left> <C-w>H
nnoremap <C-S-Down> <C-w>J
nnoremap <C-S-Up> <C-w>K
nnoremap <C-S-Right> <C-w>L
nnoremap <C-x> <C-w>c
nnoremap <C-d> :bd<CR>
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>

vmap > >gv
vmap < <gv
vnoremap . :norm.<CR>
vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
    \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap s :normal vs<CR>

"nnoremap <NL> :w\|:silent make build\|redraw!\|cw<CR>
"nnoremap <F5> :silent make test\|redraw!<CR>





"""""""""""""


nnoremap // :TComment<CR>
vnoremap // :TCommentBlock<CR>

nnoremap <silent> <F4> :<C-u>call ToggleErrors()<CR>

nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk
nnoremap <silent> ]c /\v^(\<\|\=\|\>){7}([^=].+)?$<CR>
nnoremap <silent> [c ?\v^(\<\|\=\|\>){7}([^=].+)\?$<CR>
nnoremap <F5> :UndotreeToggle<CR>
"nnoremap <C-x> :Hexmode<CR>
nnoremap <C-n> :Scratch<CR>

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

vmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"map , <Plug>(easymotion-prefix)

"nnoremap <C-b> :TlistToggle<CR>

""map <C-n> :NERDTreeToggle<CR>
