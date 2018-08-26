

if has("autocmd")
    augroup generalformating
        au!
        autocmd BufCreate,BufLeave,BufWinLeave * call clearmatches()
        autocmd VimResized  * wincmd =
        autocmd InsertLeave * set nopaste
    augroup END

    augroup ccpp
        au!
        autocmd BufEnter,BufWinEnter *.c,*.cpp,*.h,*.hpp call ShowTabs()
        " autocmd BufEnter,BufWinEnter *.c,*.h if !Ycmconf_exist() | let g:ycm_global_ycm_extra_conf='~/.vim/c/.ycm_extra_conf.py' | endif
        " autocmd BufEnter,BufWinEnter *.cpp,*.hpp if !Ycmconf_exist() | let g:ycm_global_ycm_extra_conf='~/.vim/cpp/.ycm_extra_conf.py' | endif
    augroup END

    " make 86 column stand out
    " based on  "More Instantly Better Vim" talk at OSCON 2013
    " http://youtu.be/aHm36-na4-4
    " highlight MyLineTooLongMarker ctermbg=magenta guibg=Magenta
    " call matchadd('MyLineTooLongMarker', '\%86v\S', 100)
    augroup vimrc_autocmds
        autocmd BufEnter * highlight MyLineTooLongMarker ctermbg=magenta guibg=Magenta
        autocmd BufEnter * call matchadd('MyLineTooLongMarker', '\%86v\S', 100)
    augroup END


endif
