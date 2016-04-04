"==============================
" 1 - Leader related mappings
"=============================

" remap leader
let mapleader = ","

"==============================
" 2 - Alt related mappings 
"==============================

" clears highlighted searches
nnoremap <silent> <a-c> :nohlsearch<CR>

" go to next buffer
nnoremap <a-n> :bn<CR>

" go to previous buffer
nnoremap <a-p> :bp<CR>

" saves all buffers
nnoremap <a-s> :wa<CR>

" close current buffer and move to the previous one
nmap <leader>q :bp <BAR> bd #<CR>

" save all current mappings on a text file
nnoremap <silent> <a-d> :call DumpMaps()<CR>

" closes quickfix
noremap <a-q> :ccl<CR>

"==============================
" 3 - Ctrl related mappings 
"==============================

" switch windows quickly
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" move a windown down, up, left, right respectively
nnoremap <c-down>   <c-w>J
nnoremap <c-up>     <c-w>K
nnoremap <c-left>   <c-w>H
nnoremap <c-right>  <c-w>L

"==============================
" 4 - Miscelaneous mappings 
"==============================

" visual mode pressing * or # searches for the current selection
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" if long lines with line wrapping enabled, this solves the problem that pressing
" down jumpes your cursor “over” the current line to the next line.It changes
" behaviour so that it jumps to the next row in the editor (much more natural).
nnoremap j gj
nnoremap k gk

" use Q for formatting the current paragraph (or selection)
vnoremap Q gq
nnoremap Q gqap

" make ctrl+u and ctrl+d less confusing
nnoremap <c-u> 10<c-y>10k
nnoremap <c-d> 10<c-e>10j

" insert current date and time
" nnoremap <F5> "=strftime("%Y.%m.%d (%a) %H:%M:%S (UTC %z %Z)")<CR>P
" vnoremap <F5> "=strftime("%Y.%m.%d (%a) %H:%M:%S (UTC %z %Z)")<CR>P
" inoremap <F5> <C-R>=strftime("%Y.%m.%d (%a) %H:%M:%S (UTC %z %Z)")<CR>

" make indenting and unindenting in visual mode retain the selection so
" you don't have to re-select or type gv every time.
" vnoremap > ><CR>gv
" vnoremap < <<CR>gv

" build using makeprg with <F7>
"" map <F7> :make<CR>
"set makeprg=clang++\ -g\ -Wall\ -std=c++11\ -I\ .\ -I\ /usr/local/include/\ -L\ /usr/local/lib/\ -o\ %<\ %\ -lzmq
"set makeprg=clang++\ -g\ -Wall\ -std=c++11\ -I\ .\ -I\ /usr/local/include/\ -L\ /usr/local/lib/\ -o\ %<\ %
"set makeprg=/usr/local/bin/g++-5\ -g\ -Wall\ -fno-weak\ -std=c++11\ -o\ %<\ %
" OS X
"set makeprg=/usr/local/bin/g++-5\ -g\ -Wall\ -fno-weak\ -std=c++14\ -o\ %<\ %
"set makeprg=clang++\ -g\ -Wall\ -std=c++11\ -DZYRE_BUILD_DRAFT_API=1\ -DMLM_BUILD_DRAFT_API=1\ -DCZMQ_BUILD_DRAFT_API=1\ -I/usr/local/include\ -L/usr/local/lib\ -o\ %<\ %\ -lmlm\ -lczmq\ -lzmq\ -lzyre
"set makeprg=clang\ -g\ -Wall\ -DZYRE_BUILD_DRAFT_API=1\ -DMLM_BUILD_DRAFT_API=1\ -DCZMQ_BUILD_DRAFT_API=1\ -I/usr/local/include\ -L/usr/local/lib\ -o\ %<\ %\ -lmlm\ -lczmq\ -lzmq\ -lzyre
"set makeprg=g++\ -ggdb\ -Wall\ -O0\ -std=c++11\ -o\ %<\ %
" Linux
"set makeprg=g++\ -ggdb\ -Wall\ -fno-weak\ -std=c++11\ -I\ /usr/local/include/\ -L\ /usr/local/lib/\ -lzmq\ -o\ %<\ %
"set makeprg=g++\ -ggdb\ -Wall\ -O0\ -std=c++14\ -o\ %<\ %
"set makeprg=g++\ -g\ -std=c++11\ -I/usr/local/include\ -L/usr/local/lib\ -o\ %<\ %\ -lmlm
"set makeprg=g++\ -g\ -DWITH_DRAFTS\ -I/usr/local/include\ -L/usr/local/lib\ -o\ %<\ %\ -lmlm\ -lczmq
set makeprg=g++\ -g\ -std=c++14\ -O0\ -DZYRE_BUILD_DRAFT_API=1\ -DWITH_DRAFTS=1\ -DCZMQ_BUILD_DRAFT_API=1\ -I/usr/local/include\ -L/usr/local/lib\ -o\ %<\ %\ -lzyre\ -lmlm\ -lczmq\ -lzmq\ -lpthread
nnoremap <F7> :make!<CR>
nnoremap <F5> :!./%:r<CR>
nnoremap <F10> :!gdb --tui %<<CR>
