"open help in a vertical split
command! -nargs=* -complete=help Help vertical belowright help <args>
cnoreabbrev <expr> h getcmdtype() == ":" && getcmdline() == 'h' ? 'Help' : 'h'

"make vim look nice
filetype on
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
filetype indent on
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

set linebreak
set textwidth=0
set scrolloff=3
set sidescrolloff=3

set foldenable
set foldmethod=indent
set foldlevelstart=99
set display+=lastline
set diffopt=iwhite
set switchbuf=useopen,usetab

set history=1024
set undolevels=1024
if v:version >= 730
  set backupdir=~/.vim/backup//,.
  set directory=~/.vim/swp//,.
  set undodir=~/.vim/undo//,.
  set undofile
  set colorcolumn=100
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

set iskeyword+=-
set mps+=<:>
au FileType c,cpp,java set mps+==:;


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
vmap > >gv
vmap < <gv

nnoremap <silent> <Leader>/ :set hlsearch!<CR>
filetype plugin on
autocmd FileType gitcommit setlocal spell
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.markdown setlocal spell
autocmd BufRead,BufNewFile *.txt setlocal spell

"au BufNewFile * start "start in insert mode

nn <silent> <Leader>. :set nolist!<cr>
set listchars=tab:➞\ ,trail:·,nbsp:·,precedes:«,extends:»,eol:↴
set nolist

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$\| \+\ze\t/
autocmd BufWinEnter * match extrawhitespace /\s\+$\| \+\ze\t/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$\| \+\ze\t/
autocmd InsertLeave * match ExtraWhitespace /\s\+$\| \+\ze\t/
autocmd BufWinLeave * call clearmatches()

inoremap <C-s> <C-o>:w<CR>

set hidden
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
set splitbelow
set splitright

"autocmd QuickFixCmdPre * write
set tags=tags;/
cabbrev smake silent make\|redraw!\|cw<CR>
"nnoremap <NL> :w\|:silent make build\|redraw!\|cw<CR>
"nnoremap <F5> :silent make test\|redraw!<CR>

"au FocusGained * :redraw!
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" Retab spaced file, but only indentation
command! W w !sudo tee % > /dev/null
command! RetabIndents call RetabIndents()
command! Rt call RetabIndents()

"set ts=8
" Retab spaced file, but only indentation
func! RetabIndents()
    let saved_view = winsaveview()
    set listchars=tab:➞\ ,trail:·,nbsp:·
    set list
    execute '/\t'
    set ts=8
    set et
    retab
    execute '%s@^\( \{'.&ts.'}\)\+@\=repeat("\t", len(submatch(0))/'.&ts.')@'
    call winrestview(saved_view)
endfunc

vnoremap . :norm.<CR>

if !filereadable(expand("%:p:h")."/Makefile")
 setlocal makeprg=gcc\ -Wall\ -Wextra\ -o\ %<\ %
endif

vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
    \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap s :normal vs<CR>

set laststatus=2
try
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#buffer_nr_show = 1

let g:rooter_use_lcd = 1
"let g:rooter_change_directory_for_non_project_files = 1
if executable('ag')
	set grepprg=ag\ --nogroup\ --nocolor
	let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ -g ""'
	let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
endif
let g:ctrlp_working_path_mode = 'r'

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"let g:syntastic_auto_jump=2


if exists(":TComment")
	let g:tcommentInlineC = tcomment#GetLineC('//%s')
	let g:tcommentBlockC = {
                \ 'commentstring': '/*%s */',
				\ 'begin': '/*',
				\ 'end': '*/',
				\ 'middle': '',
                \ 'rxbeg': '\*\+',
                \ 'rxend': '',
                \ 'rxmid': '',
                \ 'replacements': g:tcomment#replacements_c
                \ }
	call tcomment#DefineType('c',                tcomment#GetLineC('//%s'))
	call tcomment#DefineType('c_block',          g:tcommentBlockC   )
	call tcomment#DefineType('c_inline',         g:tcommentInlineC  )
	nnoremap // :TComment<CR>
	vnoremap // :TCommentBlock<CR>
endif

function! ToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        " Nothing was closed, open syntastic error location panel
        Errors
    endif
endfunction
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

"""
"let Tlist_Compact_Format = 1
"let Tlist_GainFocus_On_ToggleOpen = 1
"let Tlist_Close_On_Select = 1
"nnoremap <C-b> :TlistToggle<CR>
""
""let NERDTreeQuitOnOpen = 1
""map <C-n> :NERDTreeToggle<CR>
""autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
""let g:miniBufExplMapWindowNavVim = 1
""let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplUseSingleClick = 1
"""
endtry
