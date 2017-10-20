
"====================
"1 - Neobunble config
"====================

if has('vim_starting')
	set nocompatible
	"Required
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required
NeoBundleFetch 'Shougo/neobundle.vim'

"===============
"2 - Colorscheme
"===============

NeoBundle "https://github.com/nanotech/jellybeans.vim.git"
NeoBundle "https://github.com/NLKNguyen/papercolor-theme.git"
"NeoBundle 'vim-scripts/Colour-Sampler-Pack'

"================
"3 -  Programming
"================

NeoBundle 'Valloric/YouCompleteMe'

NeoBundle 'Tagbar'

NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'junegunn/fzf'
NeoBundle 'junegunn/fzf.vim'
NeoBundle 'mileszs/ack.vim'

NeoBundle 'honza/vim-snippets'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'lyuts/vim-rtags'
NeoBundle 'christoomey/vim-tmux-navigator'

NeoBundle 'pangloss/vim-javascript'

NeoBundle 'https://github.com/Raimondi/delimitMate'

"=========
"4 - Unite
"=========

"NeoBundle 'Shougo/unite.vim'
"NeoBundle 'ujihisa/unite-colorscheme'
"NeoBundle 'ujihisa/unite-outline'
"NeoBundle 'Shougo/neomru.vim'

"================
"5 - Filetypes
"================

"================
"6 - Miscelaneous
"================

NeoBundle 'https://github.com/vim-airline/vim-airline.git'
NeoBundle 'https://github.com/vim-airline/vim-airline-themes'

NeoBundle 'djoshea/vim-autoread'

NeoBundle 'https://github.com/scrooloose/nerdcommenter.git', {
\	'depends': 'https://github.com/scrooloose/nerdtree.git'
\}

NeoBundle 'https://github.com/itchyny/calendar.vim', {
\	'lazy' : 1,
\	'autoload' : {
\		'commands' : 'Calendar',
\	}
\}

NeoBundle 'https://github.com/mhinz/vim-startify.git'

NeoBundle 'https://github.com/dhruvasagar/vim-vinegar', {
\	'lazy' : 1,
\	'autoload' : {
\		'mappings' : '-'
\	}
\}

NeoBundle 'mbbill/undotree', {
\	'lazy' : 1,
\   'autoload' : {
\		'mappings' : 'F6',
\		'commands' : 'UndotreeToggle',
\	},
\}

NeoBundle 'ntpeters/vim-better-whitespace'

"=========================
"7 - Vim built-in plugins
"=========================

runtime! ftplugin/man.vim

"===========================
"8 - Under test/to be tested
"===========================
"NeoBundle 'https://github.com/Shougo/vimfiler.vim'

"=========================
"9 - NeoBundle post config
"=========================

let g:neobundle#types#git#default_protocol = "https"

call neobundle#end()

filetype plugin indent on    " required!

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

if !has('vim_starting')
	" Call on_source hook when reloading .vimrc.
	call neobundle#call_hook('on_source')
endif
