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
endif




"""
"let Tlist_Compact_Format = 1
"let Tlist_GainFocus_On_ToggleOpen = 1
"let Tlist_Close_On_Select = 1
""
""let NERDTreeQuitOnOpen = 1
""autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
""let g:miniBufExplMapWindowNavVim = 1
""let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplUseSingleClick = 1
"""
endtry
