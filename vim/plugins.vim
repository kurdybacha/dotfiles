"==================
" Installed plugins
"==================

"===============================================
" YouCompleteMe
" https://github.com/Valloric/YouCompleteMe
"===============================================

nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>gd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gt :YcmCompleter GoTo<CR>

" not used for semantic completion (default: 2)
" let g:ycm_min_num_of_chars_for_completion = 2

let g:ycm_always_populate_location_list = 1
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_max_diagnostics_to_display = 50
let g:ycm_confirm_extra_conf = 0

"==========================================
" vim-rtags
" https://github.com/lyuts/vim-rtags
"==========================================

let g:rtagsUseLocationList = 0
let g:rtagsMaxSearchResultWindowHeight = 30

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

if executable('ag')
    let g:ackprg = 'ag --silent --nocolor --nogroup --column'
endif
"nnoremap <leader>u :Ack! <cword><CR>
nnoremap <leader>a :Ack!<Space>
"vnoremap <leader>a y:Ack! <C-r>=fnameescape(@")<CR><CR>
vnoremap <leader>u y:Ack! <C-r>=fnameescape(@")<CR>


"======================================
" fzf
" https://github.com/junegunn/fzf.vim
"======================================
nnoremap <c-p> :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>t :Tags<CR>

"======================================
" CtrlP
" https://github.com/kien/ctrlp.vim.git
"======================================

"nnoremap <leader>b :CtrlPBuffer<CR>
"" The Silver Searcher
"if executable('/usr/local/bin/ag')
"  " Use ag over grep
"  set grepprg=/usr/local/bin/ag\ --ignore-case\ --nogroup\ --nocolor\ --ignore\ .git\ --ignore\ .svn\ --ignore\ .obj\ --ignore\ .moc\ --ignore\ .DS_Store\ --ignore\ \"**/*.sym\"\ -g ""'
"  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
"  let g:ctrlp_user_command = '/usr/local/bin/ag %s -l --nocolor --ignore .git --ignore .svn --ignore .obj --ignore .moc --ignore .DS_Store --ignore "**/*.sym" -g ""'
"
"  " ag is fast enough that CtrlP doesn't need to cache
"  let g:ctrlp_use_caching = 0
"endif
"
""let g:ctrlp_user_command = 'find %s -type f'
""let g:ctrlp_use_caching = 1
"let g:p_max_files=0
"let g:ctrlp_max_depth=40
""let g:ctrlp_match_window = 'results:100' " overcome limit imposed by max height
""let g:ctrlp_match_window = 'min:4,max:72'
"let g:ctrlp_by_filename=1
""let g:ctrlp_regexp = 1
"let g:ctrlp_working_path_mode = 0 "search from current directory instead of project root
"let g:ctrlp_follow_symlinks=1
"" Use vim's current working directory but fall back to the file directory
"" if it's way off.
""let g:ctrlp_custom_ignore = 'git\|moc\|obj'
"let g:ctrlp_custom_ignore = {
"  \ 'dir'  : '\v[\/]\.(obj|moc|git|hg|svn)$',
"  \ 'file' : '\v\.(exe|so|dll|class|aux|log|d)$',
"  \}

"===========================================
" UltiSnips
" https://github.com/SirVer/ultisnips.git
"===========================================
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:SnipsSnippetsDir = "~/.vim/UltiSnips"
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
" fix messed up symbols
" TODO: test it under windows
"if has('unix')
"	let g:airline_symbols.space = "\ua0"
"endif
let g:airline_symbols.space = "\ua0"

" unicode symbols
" TODO: test it under windows
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.whitespace = 'Ξ'

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
" let g:airline#extensions#tabline#fnamemod = ':p:.'

" enable/disable displaying buffers with a single tab.
"let g:airline#extensions#tabline#show_buffers = 1

" configure how numbers are calculated in tab mode.
"let g:airline#extensions#tabline#tab_nr_type = 1 " tab number

" enable paste detection
let g:airline_detect_paste=1

" enable/disable automatic population of the `g:airline_symbols` dictionary
" with powerline symbols.
let g:airline_powerline_fonts=1

" enable/disable fugitive/lawrencium integration
let g:airline#extensions#branch#enabled=1

" change the text for when no branch is detected
let g:airline#extensions#branch#empty_message = ''

" enable/disable eclim integration, which works well with the
" |airline-syntastic| extension. >
let g:airline#extensions#eclim#enabled = 0

"================================================
" nerdtree
" https://github.com/scrooloose/nerdtree.git
"================================================

let NERDTreeCaseSensitiveSort = 1
let NERDTreeChDirMode         = 1
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

