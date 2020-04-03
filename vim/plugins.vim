"==================
" Installed plugins
"==================

"===============================================
" Asynchronous Lint Engine
" https://github.com/w0rp/ale
"===============================================

let g:ale_sign_error='●'
let g:ale_sign_warning='.'
let g:ale_linters = {
    \ 'javascript': ['eslint'],
    \ 'python': ['flake8', 'pylint', 'pyls' ],
    \ }
let g:ale_fixers = {
    \ 'javascript': ['eslint'],
    \ 'python': ['black']
    \ }
" Disable pycodestyle and let flake8 or pylint do the work
let g:ale_python_pyls_config = {'pyls': {'configurationSource':['pycodestyle'],
                                       \ 'plugins': {
                                          \ 'pycodestyle': {'enabled': v:false}}}}
let g:ale_javascript_eslint_executable='npx eslint'
let g:ale_lint_on_enter=0
let g:ale_lint_on_text_changed='never'
let g:ale_completion_enabled = 1
" let g:ale_cpp_clangd_executable='clangd -background-index'
" let g:ale_cpp_clangd_options='-background-index'

nnoremap <leader>jd :ALEGoToDefinition<CR>
nnoremap <leader>jt :ALEGoToTypeDefinition<CR>
nnoremap <leader>jr :ALEFindReferences<CR>
nnoremap <leader>jh :ALEHover<CR>
nnoremap <leader>js :ALESymbolSearch <C-r><C-w><CR>

"===============================================
" YouCompleteMe
" https://github.com/Valloric/YouCompleteMe
"===============================================

" nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
" nnoremap <leader>gd :YcmCompleter GoToDefinition<CR>
" nnoremap <leader>gt :YcmCompleter GoTo<CR>

" not used for semantic completion (default: 2)
" let g:ycm_min_num_of_chars_for_completion = 2

let g:ycm_always_populate_location_list = 1
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_max_diagnostics_to_display = 50
let g:ycm_confirm_extra_conf = 0
" Let clangd fully control code completion
" let g:ycm_clangd_uses_ycmd_caching = 0
" Use installed clangd, not YCM-bundled clangd which doesn't get updates.
" let g:ycm_clangd_binary_path = exepath("clangd")
" let g:ycm_use_clangd = 1
" let g:ycm_clangd_args = ["-background-index"]

"==========================================
" vim-rtags
" https://github.com/lyuts/vim-rtags
"==========================================

let g:rtagsUseLocationList = 0
let g:rtagsMaxSearchResultWindowHeight = 30

"==========================================
" LanguageClient-neovim
" https://github.com/autozimu/LanguageClient-neovim
"==========================================
"
" let g:LanguageClient_serverCommands = {
"     \ 'python': ['/usr/bin/pyls'],
"     \ }
" let g:LanguageClient_diagnosticsEnable = 0
" let s:LanguageClient_serverCommands_c = [
"       \ 'clangd',
"       \ '-all-scopes-completion',
"       \ '-background-index',
"       \ '-clang-tidy',
"       \ '-compile_args_from=filesystem',
"       \ '-completion-style=detailed',
"       \ '-function-arg-placeholders',
"       \ '-header-insertion-decorators',
"       \ '-include-ineligible-results',
"       \ '-index',
"       \ '-index-file=clangd.dex',
"       \ '-input-style=standard',
"       \ '-j=12',
"       \ '-pch-storage=disk',
"       \ '-static-func-full-module-prefix',
"       \ '-use-dbg-addr',
"       \ '-use-dex-index',
"       \ '-view-background',
"       \ ]
"
" nnoremap <leader>jj :call LanguageClient_contextMenu()<CR>
"==========================================
" vim-lsp (Language Server Protocol)
" https://github.com/prabirshrestha/vim-lsp
"==========================================

" if executable('pyls')
"     " pip install python-language-server
"     au User lsp_setup call lsp#register_server({
"         \ 'name': 'pyls',
"         \ 'cmd': {server_info->['pyls']},
"         \ 'whitelist': ['python'],
"         \ })
" endif
"
" " if executable('cquery')
" "     au User lsp_setup call lsp#register_server({
" "         \ 'name': 'cquery',
" "         \ 'cmd': {server_info->['cquery']},
" "         \ 'initialization_options': { 'cacheDirectory': '/tmp/cquery/cache' },
" "         \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
" "         \ })
" " endif
" let g:lsp_signs_enabled = 1         " enable signs
" " let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode
" " nnoremap <leader>ri :LspHover<CR>
" " nnoremap <leader>rj :LspDefinition<CR>
"
" let g:lsp_async_completion = 1
" let g:lsp_log_verbose = 1
" let g:lsp_log_file = expand('~/vim-lsp.log')
"
" " for asyncomplete.vim log
" let g:asyncomplete_auto_popup=1
" let g:asyncomplete_remove_duplicates=1
" let g:asyncomplete_log_file = expand('~/asyncomplete.log')
" let g:lsp_signs_error = {'text': 'x'}
" let g:lsp_signs_warning = {'text': '‼'}

"==========================================
" tagbar
" https://github.com/majutsushi/tagbar
" http://majutsushi.github.io/tagbar/
"==========================================

" TODO: review config
nnoremap <silent> <F8> :TagbarToggle<CR>
let g:tagbar_autoclose   = 1
let g:tagbar_autofocus   = 1
let g:tagbar_sort        = 0
let g:tagbar_iconchars   = ['▾', '▸']
let g:tagbar_autoshowtag = 1

let g:tagbar_type_armasm = {
	\ 'ctagsbin'  : 'ctags',
	\ 'ctagsargs' : '-f- --format=2 --excmd=pattern --fields=nksSa --extra= --sort=no --language-force=asm',
	\ 'kinds' : [
		\ 'm:macros:0:1',
		\ 't:types:0:1',
		\ 'd:defines:0:1',
		\ 'l:labels:0:1'
	\ ]
\}

"===========================================
" a.vim
" https://github.com/vim-scripts/a.vim
"===========================================
" Switches between e.g. h and cpp
nnoremap <silent> <leader>s :A <CR>

"===========================================
" vim-fugitive
" https://github.com/tpope/vim-fugitive
"===========================================

"========================================
" rainbow parenthesis improved
" https://github.com/oblitum/rainbow
"========================================

"au FileType c,cpp,objc,objcpp call rainbow#load()
"let g:rainbow_active = 1
"
"let g:rainbow_load_separately = [
"    \ [ '*.c' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
"    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
"    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
"    \ ]
"
"======================================
" Ack
" https://github.com/mileszs/ack.vim.git
"======================================

" if executable('ag')
"     let g:ackprg = 'ag --vimgrep'
" elseif executable('rg')
"     let g:ackprg = 'rg --vimgrep --smart-case -g !tags'
" endif
" " let g:ack_use_dispatch = 1
" nnoremap <leader>u :Ack! <cword><CR>
" nnoremap <leader>U :Ack! --no-ignore<cword><CR>
" nnoremap <leader>a :Ack!<Space>
" nnoremap <leader>A :Ack! --no-ignore<Space>
" vnoremap <leader>a y:Ack! <C-r>=fnameescape(@")<CR><CR>
" vnoremap <leader>A y:Ack! --no-ignore <C-r>=fnameescape(@")<CR><CR>
" vnoremap <leader>u y:Ack! <C-r>=fnameescape(@")<CR>
" vnoremap <leader>U y:Ack! --no-ignore <C-r>=fnameescape(@")<CR>


"======================================
" fzf
" https://github.com/junegunn/fzf.vim
"======================================
" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Changing defaults binding from Alt-a and Alt-d as it clashes with i3
let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all,ctrl-d:deselect-all'
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -g !tags '.<q-args>,
  \   1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

nnoremap <c-p> :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>m :Marks<CR>
nnoremap <leader>l :BLines<CR>

nnoremap <leader>a :Rg!<Space>
nnoremap <leader>A :Rg! --no-ignore<Space>
nnoremap <leader>u :Rg! <C-r><C-w><CR>
nnoremap <leader>U :Rg! --no-ignore <C-r><C-w><CR>

vnoremap <leader>a y:Rg! <C-r>=fnameescape(@")<CR><CR>
vnoremap <leader>A y:Rg! --no-ignore <C-r>=fnameescape(@")<CR><CR>
vnoremap <leader>u y:Rg! <C-r>=fnameescape(@")<CR>
vnoremap <leader>U y:Rg! --no-ignore <C-r>=fnameescape(@")<CR>

"===========================================
" UltiSnips
" https://github.com/SirVer/ultisnips.git
"===========================================
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsSnippetsDir='~/.vim/UltiSnips'
" let g:UltiSnipsSnippetDirectories=[$HOME."~/.vim/UltiSnips"]
let g:UltiSnipsExpandTrigger="<c-b>"

let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-f>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:snips_author = 'Pawel Kurdybacha'

"===========================================
" delimitmate
" https://github.com/blueyed/delimitMate
"===========================================

"let delimitMate_matchpairs = "(:),[:],{:}"
let delimitMate_expand_cr = 2
let delimitMate_expand_space = 1
let delimitMate_expand_inside_quotes = 1
let delimitMate_balance_matchpairs = 1
let delimitMate_excluded_regions = "Comment,String"

let delimitMate_excluded_ft = "mail,text,txt,log,messages"
if has("autocmd")
	au FileType c,cpp,perl let delimitMate_insert_eol_marker = 0
	au FileType c,cpp,perl let delimitMate_eol_marker = ";"
endif

"==========================================
" vim-better-whitespace
" https://github.com/ntpeters/vim-better-whitespace
"==========================================

highlight ExtraWhitespace ctermbg=52 guibg=#FF0000


"==========================================
" vim-airline
" https://github.com/bling/vim-airline
"==========================================

" The powerline symbols need the powerline fonts:
" https://github.com/Lokaltog/powerline-fonts
"
" check whether a dictionary if it exists
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
" " fix messed up symbols
" " TODO: test it under windows
" "if has('unix')
" "	let g:airline_symbols.space = "\ua0"
" "endif
" let g:airline_symbols.space = "\ua0"

" unicode symbols
" TODO: test it under windows
" let g:airline_left_sep = '»'
" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '«'
" let g:airline_right_sep = '◀'
" let g:airline_symbols.linenr = '␊'
" let g:airline_symbols.linenr = '␤'
" let g:airline_symbols.linenr = '¶'
" let g:airline_symbols.branch = '⎇'
" let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'
" let g:airline_symbols.paste = '∥'
" let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''

" Set airline theme manually
let g:airline_theme="bubblegum"

" enable/disable enhanced tabline.
let g:airline#extensions#tabline#enabled = 1

" configure non collapsing parent directories in buffer name. >
"let g:airline#extensions#tabline#fnamecollapse = 0

" configure the formatting of filenames (see |filename-modifiers|). >
let g:airline#extensions#tabline#fnamemod = ':p:.'

" enable/disable displaying buffers with a single tab.
let g:airline#extensions#tabline#show_buffers = 1

" configure how numbers are calculated in tab mode.
"let g:airline#extensions#tabline#tab_nr_type = 1 " tab number

" enable paste detection
" let g:airline_detect_paste=1

" enable/disable automatic population of the `g:airline_symbols` dictionary
" with powerline symbols.
let g:airline_powerline_fonts=1

" enable/disable fugitive/lawrencium integration
" let g:airline#extensions#branch#enabled=1

" change the text for when no branch is detected
" let g:airline#extensions#branch#empty_message = ''

" enable/disable eclim integration, which works well with the
" |airline-syntastic| extension. >
" let g:airline#extensions#eclim#enabled = 0

"================================================
" nerdtree
" https://github.com/scrooloose/nerdtree.git
"================================================

let NERDTreeCaseSensitiveSort = 1
let NERDTreeChDirMode         = 0
let NERDTreeQuitOnOpen        = 0
let NERDTreeShowHidden        = 1
let NERDTreeShowLineNumbers   = 1
nnoremap <F9>  :NERDTreeToggle<cr>

"====================================================
" nerdtreecommenter
" https://github.com/scrooloose/nerdcommenter.git
"====================================================

" add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

"============================================
" calendar.vim
" https://github.com/itchyny/calendar.vim
"============================================
let g:calendar_date_endian     = "big"
let g:calendar_date_separator  = "."
let g:calendar_first_day       = "monday"
let g:calendar_week_number     = 1
let g:calendar_date_month_name = 1
let g:calendar_views           = ['year', 'month', 'week', 'clock']
let g:calendar_updatetime      = 900
nnoremap <F3>  :Calendar -position=tab<cr>

"===========================================
" vim-startify
" https://github.com/mhinz/vim-startify
"===========================================

let g:startify_files_number = 5

highlight StartifyFooter  ctermfg=green
highlight StartifyFooter  guifg=green
highlight StartifyHeader  ctermfg=red
highlight StartifyHeader  guifg=red

let g:startify_skiplist = [
		\ 'COMMIT_EDITMSG',
		\ $VIMRUNTIME .'/doc',
		\ 'bundle/.*/doc',
		\ '\.DS_Store'
		\ ]

let g:startify_bookmarks = [
			\'~/.vimrc',
			\'~/.vim/abbrev.vim',
			\'~/.vim/augroup.vim',
			\'~/.vim/config.vim',
			\'~/.vim/mappings.vim',
			\'~/.vim/neobundle.vim',
			\'~/.vim/plugins.vim'
			\]

" ascii text: http://patorjk.com/software/taag/
let g:startify_custom_header = [
            \'     _   _      _ _        ______                  _ ',
            \'    | | | |    | | |       | ___ \                | |',
            \'    | |_| | ___| | | ___   | |_/ /__ ___     _____| |',
            \'    |  _  |/ _ \ | |/ _ \  |  __/ _  \ \ /\ / / _ \ |',
            \'    | | | |  __/ | | (_) | | | | (_| |\ V  V /  __/ |',
            \'    \_| |_/\___|_|_|\___/  \_|  \____| \_/\_/ \___|_|',
            \ '',
			\ ]

let g:startify_custom_footer = [
	\ '',
    \'   “There are only two kinds of languages: the ones people complain about and the ones nobody uses.”',
    \'   ― Bjarne Stroustrup',
	\ '',
	\'   “It is not that I am so smart ,it is just that I stay with problems longer.”',
	\ '  - Albert Einstein',
	\ '',
	\ ]


if has('gui_running')
	call SetWindowSize()
endif

"========================================
" undotree
" https://github.com/mbbill/undotree
"========================================
nnoremap <silent> <F6> :UndotreeToggle<CR>
let g:undotree_WindowLayout = 2
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_SplitWidth = 40

"======================================
" man
" runtime/ftplugin/man.vim
"======================================
nnoremap K :Man <cword><cr>

