"=========================================
" 17 - Unite
"      https://github.com/Shougo/unite.vim
"=========================================
" The prefix key.
nnoremap [unite] <Nop>
nmap <space> [unite]

let g:unite_prompt = '» '
let g:unite_source_history_yank_enable = 1
let g:unite_data_directory="~/.vim/.cache/unite"

if has('unix')
	let g:unite_source_grep_command = 'ag'
	let g:unite_source_grep_default_opts =
          \ '--line-numbers --column --nocolor --nogroup --hidden --ignore ' .
          \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
	let g:unite_source_grep_recursive_opt = ''
elseif has('win32') || ('win64')
	let g:unite_source_grep_command = 'grep'
	let g:unite_source_rec_async_command = 'ls -aR'
	let g:unite_source_grep_default_opts = '-i  -n'
	let g:unite_source_grep_recursive_opt = '-r'
endif

call unite#custom_source('file_rec,file_rec/async', 'matchers',
            \ ['converter_relative_word', 'matcher_default'])
call unite#custom_source('file_rec,file_rec/async', 'converters',
            \ 'converter_relative_abbr')

" Test
call unite#custom#source( 'buffer', 'converters', ['converter_file_directory'])

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
"   Runs "split" action by <C-s>.
    imap <silent><buffer><expr> <C-s>     unite#do_action('split')
	imap <buffer> <C-j> <Plug>(unite_select_next_line)
	imap <buffer> <C-k> <Plug>(unite_select_previous_line)
	imap <buffer> <c-a> <Plug>(unite_choose_action)
	imap <buffer> <ESC> <Plug>(unite_exit)
	nmap <buffer> <ESC> <Plug>(unite_exit)
endfunction

" General purpose - list all sources
nnoremap [unite]<space> :Unite -no-split -start-insert source<cr>
nnoremap [unite]p :Unite file_rec/async<cr>
nnoremap [unite]/ :Unite grep:.<cr>
nnoremap [unite]y :Unite history/yank<cr>
nnoremap [unite]b :Unite buffer<cr>
nnoremap [unite]r :<C-u>Unite -start-insert file_rec/async:!<CR>
nnoremap [unite]M :Unite -quick-match colorscheme<CR>
nnoremap [unite]t :<C-u>Unite -buffer-name=buffer  buffer<cr>
" show document outline
nnoremap [unite]o :Unite -no-split -auto-preview outline<CR>

" line search
nnoremap [unite]l :Unite -no-split -start-insert line<cr>

nnoremap <silent> [unite]c  :<C-u>UniteWithCurrentDir
        \ -buffer-name=files buffer bookmark file<CR>

" list mappings
nnoremap <silent> [unite]ma :<C-u>Unite mapping<CR>

nnoremap [unite]F :Unite -no-split buffer tab file_mru directory_mru<cr>
" Quickly switch between recent things
nnoremap <silent> [unite]m :Unite -buffer-name=recent -winheight=15 file_mru<cr>

nnoremap <silent> [unite]f :<C-u>Unite -buffer-name=resume resume<CR>
nnoremap <silent> [unite]me :<C-u>Unite output:message<CR>
