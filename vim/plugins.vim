"==================
" Installed plugins
"==================

let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default': {
  \       'transparent_background': 0
  \     }
  \   }
  \ }

"===============================================
" Conquer of Completion
" https://github.com/neoclide/coc.nvim
"===============================================

let g:coc_global_extensions = ['coc-pyright', 'coc-flutter', 'coc-clangd' ]

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
 if (index(['vim','help'], &filetype) >= 0)
   execute 'h '.expand('<cword>')
 else
   call CocAction('doHover')
 endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>jap` for current paragraph
xmap <leader>j  <Plug>(coc-codeaction-selected)
nmap <leader>j  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>jc  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>jf  <Plug>(coc-fix-current)

imap <C-b> <Plug>(coc-snippets-expand)
let g:coc_snippet_next = '<c-f>'
let g:coc_snippet_prev = '<c-b>'

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


"===============================================
" Asynchronous Lint Engine
" https://github.com/w0rp/ale
"===============================================

"let g:ale_sign_error='●'
"let g:ale_sign_warning='.'
"let g:ale_linters = {
"    \ 'javascript': ['eslint'],
"    \ 'python': ['flake8', 'pyls' ],
"    \ 'cpp': ['clangd'],
"    \ 'dart': ['dartanalyzer'],
"    \ }
"let g:ale_fixers = {
"    \ 'javascript': ['eslint'],
"    \ 'python': ['black'],
"    \ 'cpp': ['clang-format'],
"    \ 'dart': ['dartfmt'],
"    \ }
" Disable pycodestyle and let flake8 or pylint do the work
" let g:ale_python_pyls_config = {'pyls': {'configurationSource':['pycodestyle'],
"                                        \ 'plugins': {
"                                           \ 'pycodestyle': {'enabled': v:false}}}}
" let g:ale_javascript_eslint_executable='npx eslint'
" let g:ale_lint_on_enter=0
" let g:ale_lint_on_text_changed='never'
" let g:ale_completion_enabled = 1
" " let g:ale_cpp_clangd_executable='clangd -background-index'
" " let g:ale_cpp_clangd_options='-background-index'
"
"nnoremap <leader>gd :ALEGoToDefinition<CR>
"nnoremap <leader>gt :ALEGoToTypeDefinition<CR>
"nnoremap <leader>gr :ALEFindReferences<CR>
"nnoremap <leader>gh :ALEHover<CR>
"nnoremap <leader>gs :ALESymbolSearch <C-r><C-w><CR>

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
" fzf
" https://github.com/junegunn/fzf.vim
"======================================
" Customize fzf colors to match your color scheme
" let g:fzf_colors =
" \ { 'fg':      ['fg', 'Normal'],
"   \ 'bg':      ['bg', 'Normal'],
"   \ 'hl':      ['fg', 'Comment'],
"   \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"   \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"   \ 'hl+':     ['fg', 'Statement'],
"   \ 'info':    ['fg', 'PreProc'],
"   \ 'border':  ['fg', 'Ignore'],
"   \ 'prompt':  ['fg', 'Conditional'],
"   \ 'pointer': ['fg', 'Exception'],
"   \ 'marker':  ['fg', 'Keyword'],
"   \ 'spinner': ['fg', 'Label'],
"   \ 'header':  ['fg', 'Comment'] }

" Changing defaults binding from Alt-a and Alt-d as it clashes with i3
let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all,ctrl-d:deselect-all'
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -g !tags '.<q-args>,
  \   1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

nnoremap <leader>p :Files<CR>
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
" dart-vim-plugin
"===========================================
let g:dart_style_guide = 2
let g:dart_format_on_save = 1

"===========================================
" vim-flutter
" https://github.com/thosakwe/vim-flutter
"===========================================
" nnoremap <leader>fr :FlutterRun<cr>
" nnoremap <leader>fq :FlutterQuit<cr>
" nnoremap <leader>fr :FlutterHotReload<cr>
" nnoremap <leader>fR :FlutterHotRestart<cr>
" nnoremap <leader>fD :FlutterVisualDebug<cr>

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
" let g:snips_author = 'Pawel Kurdybacha'

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

let g:startify_change_to_dir = 0

" let g:startify_files_number = 5
"
" highlight StartifyFooter  ctermfg=green
" highlight StartifyFooter  guifg=green
" highlight StartifyHeader  ctermfg=red
" highlight StartifyHeader  guifg=red
"
" let g:startify_skiplist = [
"         \ 'COMMIT_EDITMSG',
"         \ $VIMRUNTIME .'/doc',
"         \ 'bundle/.*/doc',
"         \ '\.DS_Store'
"         \ ]
"
" let g:startify_bookmarks = [
"             \'~/.vimrc',
"             \'~/.vim/abbrev.vim',
"             \'~/.vim/augroup.vim',
"             \'~/.vim/config.vim',
"             \'~/.vim/mappings.vim',
"             \'~/.vim/neobundle.vim',
"             \'~/.vim/plugins.vim'
"             \]

" ascii text: http://patorjk.com/software/taag/
" let g:startify_custom_header = [
"             \'     _   _      _ _        ______                  _ ',
"             \'    | | | |    | | |       | ___ \                | |',
"             \'    | |_| | ___| | | ___   | |_/ /__ ___     _____| |',
"             \'    |  _  |/ _ \ | |/ _ \  |  __/ _  \ \ /\ / / _ \ |',
"             \'    | | | |  __/ | | (_) | | | | (_| |\ V  V /  __/ |',
"             \'    \_| |_/\___|_|_|\___/  \_|  \____| \_/\_/ \___|_|',
"             \ '',
"             \ ]
"
" let g:startify_custom_footer = [
"     \ '',
"     \'   “There are only two kinds of languages: the ones people complain about and the ones nobody uses.”',
"     \'   ― Bjarne Stroustrup',
"     \ '',
"     \'   “It is not that I am so smart ,it is just that I stay with problems longer.”',
"     \ '  - Albert Einstein',
"     \ '',
"     \ ]


if has('gui_running')
	call SetWindowSize()
endif

"========================================
" undotree
" https://github.com/mbbill/undotree
"========================================
" nnoremap <silent> <F6> :UndotreeToggle<CR>
" let g:undotree_WindowLayout = 2
" let g:undotree_SetFocusWhenToggle = 1
" let g:undotree_SplitWidth = 40

"======================================
" man
" runtime/ftplugin/man.vim
"======================================
nnoremap K :Man <cword><cr>

