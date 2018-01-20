
"====================
"1 - vim-plug config
"====================

call plug#begin('~/.vim/bundle')

"===============
"2 - Colorscheme
"===============

Plug 'NLKNguyen/papercolor-theme'
"Plug 'nanotech/jellybeans.vim.git'
"NeoBundle 'vim-scripts/Colour-Sampler-Pack'

"================
"3 -  Programming
"================

Plug 'majutsushi/tagbar'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'junegunn/fzf', { 'do': './install --all' } | Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'SirVer/ultisnips'| Plug 'honza/vim-snippets'
Plug 'lyuts/vim-rtags'
Plug 'christoomey/vim-tmux-navigator'
Plug 'pangloss/vim-javascript'
"Plug 'https://github.com/Raimondi/delimitMate'
" manually installed, vim-plug will load, but will not try to install or
" update
Plug '~/.vim/plugged/YouCompleteMe'

"================
"4 - Miscelaneous
"================

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'| Plug 'scrooloose/nerdcommenter'
Plug 'itchyny/calendar.vim'
Plug 'mhinz/vim-startify'
Plug 'mbbill/undotree'
Plug 'ntpeters/vim-better-whitespace'

"=========================
"7 - Vim built-in plugins
"=========================

runtime! ftplugin/man.vim

"===========================
"8 - Under test/to be tested
"===========================
"Plug 'Shougo/vimfiler'

call plug#end()
