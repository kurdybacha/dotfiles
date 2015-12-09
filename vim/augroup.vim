

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

	augroup python
		au!
		autocmd BufEnter,BufWinEnter *.py,SConstruct call ShowTabs()
		autocmd BufEnter,BufWinEnter *.py,SConstruct setlocal noexpandtab
	augroup END

	augroup sh
		au!
		autocmd BufEnter,BufWinEnter *.sh call ShowTabs()
		autocmd BufEnter,BufWinEnter *.sh setlocal noexpandtab
	augroup END

	augroup vim
		au!
		autocmd BufEnter,BufWinEnter *.vim call ShowTabs()
		autocmd BufEnter,BufWinEnter *.vim setlocal noexpandtab
	augroup END
endif
