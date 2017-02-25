
"========
" General
"========

set nocompatible                   " disable vi compatibility
set autowriteall                   " automatically save all buffers
set autoread                      " load file modified outside vim
set nobackup                       " do not write backup files
set noswapfile                     " do not write .swp files
set backspace=indent,eol,start     " see :help bs
set helplang=en                    " help language
set history=200                    " command history
set spelllang=en,pl                " set your favorite language here
set completeopt=menu               " menu completion options
set ttyfast                        " fast terminal connection
set hidden                         " don't discard buffers
set ttimeoutlen=50                 " timeout for a key sequence complete
"set pastetoggle=<F2>              " enables paste mode
set noeol                          " no empty line at the end of file

if has("browse")
	set browsedir=buffer           " defaults to the current file's directory
endif

" Force utf-8. Fallback latin1. Always use unix file format
if has('multi_byte')
	if has('unix')
		set termencoding=utf-8
		set encoding=utf-8
		set fileformat=unix
		set fileformats=unix
	elseif has('mac') || has('macunix')
		set termencoding=utf-8
		set encoding=utf-8
		set fileformat=unix
		set fileformats=unix
	elseif has('win32') || has('win64')
		set termencoding=utf-8
		set encoding=utf-8
		set fileformat=dos
		set fileformats=dos,unix
	else
		set termencoding=utf-8
		set encoding=utf-8
		set fileformat=unix
		set fileformats=unix
	endif
else
	set termencoding=latin1
	set encoding=latin1
endif

" centralize undo files
" the directory must be created manually
if has("persistent_undo")
	set undodir=~/.vim/.undodir
	set undofile
endif

"======
" Sound
"======
set t_vb=                " disable the  annoyng visual and sound bell :)
set novisualbell         " no noise
set noerrorbells         " no noise

"=======================
" Text formatting
"=======================
syntax enable        " syntax highlight on and keep your settings
set autoindent       " use indentation of previous line
set smartindent      " use intelligent indentation for C
set tabstop=4        " tab width is 4 spaces
set softtabstop=4    " unify
set shiftwidth=4     " indent also with 4 spaces
set expandtab        " expand tabs to spaces
set smarttab         " expand tabs to spaces
set nowrap           " do not wrap words (view)
set textwidth=0      " do not wrap words (insert)
"filetype off

" folding
set foldcolumn=0     " columns for folding
set foldmethod=indent
set foldlevel=9
set nofoldenable     "dont fold by default "

"==========
" Searching
"==========
set incsearch        " Incremental search
set hlsearch         " Highlight search match
set ignorecase       " Do case insensitive matching
set smartcase        " do not ignore if search pattern has CAPS
"set guioptions-=T    " disable toolbar"

" wildmenu: ignore these extensions

"set wildmode=longest:full,full
set wildignore=*.o,*.obj,*.bak,*.exe,*~,*.aux,*.fls
if has('unix')
	set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
else
	set wildignore+=*\\.git\\*,*\\.hg\\*,*\\.svn\\*
endif

"===================
" GUI/Visual Options
"===================
tab all                      " open a new tab instead of a new vim instance
set showcmd                  " show command in last line of screen
set laststatus=2             " statusline always visible
set shortmess=aToO           " see: help shortmess
set ruler                    " Show cursor line and column number position
set number                   " show line numbers
set relativenumber           " show relative line numbers
set scrolloff=2              " number of screen lines to keep above and below the cursor.
set splitright               " Always splits to the right and below
set splitbelow
"set showbreak=↳              " Show the linebreak for a long line
set noshowmode               " Don't show the mode, Powerline shows it
set showmatch                " When a bracket is inserted, briefly jump to the matching one.
set matchtime=2              " Tenths of a second to show the matching parten
set equalalways
set ead=both                 " set in which direction 'equalalways' works (ver, hor, both)
set wildmenu                 " use autocompletion on command line
set cursorline               " sets cursor line highlight.
set display=uhex             " show unprintable characters hexadecimal
"set listchars=tab:▸\ ,eol:¬
if has('mouse')
	set mouse=a              " enable mouse in all modes
	set mousehide            " hides the mouse while typing
endif

"colorscheme jellybeans
"colorscheme solarized
colorscheme PaperColor
"let g:PaperColor_Dark_Override = { 'background' : '#1c1c1c'  }
set t_ut=                    " disable Background Color Erase (BCE) so that color schemes work properly when vim is used inside tmux
if has('gui_running')
	set guioptions=aAgi      " see: help guioptions
	set background=dark

	if has('unix')
		if exists("g:guifont")
			let &guifont=g:guifont
		else
			set guifont=Monospace\ 9
		endif
	elseif has ('mac')
		set guifont=Monospace\ 9
	elseif has ('win32') || ('win64')
		if exists("g:winguifont")
			let &guifont=g:winguifont
		else
			set guifont=Lucida_Sans_Typewriter:h9
		endif
	endif

	set mousemodel=popup
else
	set background=dark
	" Enable 256 colors in terminal
	" if &term == 'xterm' || &term == 'screen' || &term =='terminator' || &term == 'gnome-terminal'
	  set t_Co=256
	" endif
endif

