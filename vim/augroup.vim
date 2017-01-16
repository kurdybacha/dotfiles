

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
		autocmd BufEnter,BufWinEnter *.c,*.h if !Ycmconf_exist() | let g:ycm_global_ycm_extra_conf='~/.vim/c/.ycm_extra_conf.py' | endif
		autocmd BufEnter,BufWinEnter *.cpp,*.hpp if !Ycmconf_exist() | let g:ycm_global_ycm_extra_conf='~/.vim/cpp/.ycm_extra_conf.py' | endif
	augroup END

endif
