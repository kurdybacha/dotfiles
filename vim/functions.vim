
function! DumpMaps()
	redir! > ~/vim_maps.txt
	map
	map!
	redir END
endfunction

function! SetWindowSize()
	"if line('$') == 1 && getline(1) == ''
	"	 return
	"else
		if has("gui_running")
			set lines=45 columns=90
		else
			" This is console Vim.
			if exists("+lines")
				set lines=45
			endif
			if exists("+columns")
				set columns=90
			endif
		endif
	"endif
endfunction

function! ShowTabs()
		setlocal listchars=tab:▸\ ,eol:¬
		setlocal list
endfunction

function! Ycmconf_exist()
	if !filereadable("~/.vim/bundle/YouCompleteMe/install.sh")
		return 0
	endif

	let foo=getcwd().".ycm_extra_conf.py"

	if filereadable(foo)
		return 1
	else
		return 0
	endif
endfunction
