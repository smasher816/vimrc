"open help in a vertical split
command! -nargs=* -complete=help Help vertical belowright help <args>
cnoreabbrev <expr> h getcmdtype() == ":" && getcmdline() == 'h' ? 'Help' : 'h'

au FileType c,cpp,java set mps+==:;

autocmd FileType gitcommit setlocal spell
autocmd FileType text setlocal spell
autocmd FileType markdown setlocal spell
autocmd FileType changelog setlocal spell
autocmd FileType help setlocal nospell
"au BufNewFile * start "start in insert mode

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$\| \+\ze\t/
autocmd BufWinEnter * match extrawhitespace /\s\+$\| \+\ze\t/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$\| \+\ze\t/
autocmd InsertLeave * match ExtraWhitespace /\s\+$\| \+\ze\t/
autocmd BufWinLeave * call clearmatches()

"autocmd QuickFixCmdPre * write
cabbrev smake silent make\|redraw!\|cw<CR>

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

function! ToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        " Nothing was closed, open syntastic error location panel
        Errors
    endif
endfunction
