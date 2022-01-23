
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
Plug 'tpope/vim-eunuch'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plug 'mileszs/ack.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Plug 'lyuts/vim-rtags'
Plug 'christoomey/vim-tmux-navigator'
Plug 'rhysd/vim-clang-format'
"JavaScript related
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
"Plug 'w0rp/ale'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'hashivim/vim-terraform'
Plug 'fatih/vim-go'
Plug 'aklt/plantuml-syntax'
Plug 'tomlion/vim-solidity'
"Android related
Plug 'dart-lang/dart-vim-plugin'
Plug 'milch/vim-fastlane'
Plug 'thosakwe/vim-flutter'
"Plug 'https://github.com/Raimondi/delimitMate'
" manually installed, vim-plug will load, but will not try to install or
" update
" Plug '~/.vim/plugged/YouCompleteMe'
" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Plug 'prabirshrestha/async.vim'
" Plug 'prabirshrestha/vim-lsp'
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'prabirshrestha/asyncomplete-lsp.vim'

"================
"4 - Miscelaneous
"================

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'| Plug 'scrooloose/nerdcommenter'
Plug 'itchyny/calendar.vim'
Plug 'mhinz/vim-startify'
"Plug 'mbbill/undotree'
" Plug 'ntpeters/vim-better-whitespace'
Plug 'vim-scripts/a.vim'
Plug 'jeffkreeftmeijer/vim-numbertoggle'

"=========================
"7 - Vim built-in plugins
"=========================

runtime! ftplugin/man.vim

"===========================
"8 - Under test/to be tested
"===========================
"Plug 'Shougo/vimfiler'

call plug#end()
