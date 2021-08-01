" Remap Personal Keyboard
map <Space> <Leader>

" Copy the entire code
map <Leader>y <Esc>:%y+<CR>

" Go to beginning or end of a line easier
nnoremap H ^
nnoremap L $

" Open file under cursor in new tab
nnoremap <leader>go <Esc><C-W>gF<CR>:tabm<CR>

" Direction keys for wrapped lines
nnoremap <silent> k gk
nnoremap <silent> j gj

" Tabs and Shift Tabs works like other editors
inoremap <S-tab> <c-d>
vnoremap <tab> >gv
vnoremap <S-Tab> <gv

" Vertically split screen
nnoremap <silent><leader>\ :vs<CR>
" Split screen
nnoremap <silent><leader>/ :split<CR>

" Faster saving and exiting
nnoremap <silent><leader>w :w!<CR>
nnoremap <silent><leader>q :q!<CR>

" Exit from Terminal mode using ESC
:tnoremap <Esc> <C-\><C-n>

" Open New Tab
nnoremap <F5> <Esc>:tabnew<CR>

" Faster formating entire file
nnoremap <F6> gg=G

" Extra <CR> is for disabling /"Press ENTER or type command to continue/"
nnoremap <silent><leader>e :Exp<CR><CR>

" Enable folding with z key
nmap z za

" Easier movement between split windows CTRL + {h, j, k, l}
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" Remove arrow keys
nnoremap <up> <PageUp>
nnoremap <down> <PageDown>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Resize, Split and Tabs Commands
" Split resize commands
nnoremap <S-left> :vertical resize +5<CR>
nnoremap <S-right> :vertical resize -5<CR>
nnoremap <S-down> :resize -5<CR>
nnoremap <S-up> :resize +5<CR>

" Useful for tabs
nnoremap <Leader>t :tabnew<CR>
" Change tabs
nnoremap <right> gt
nnoremap <left> gT

" Move current line / selection up/down
" ˚ and ∆ are <Alt-k> and <Alt-j> respectly on my keyboard
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

" Buffer change
" Move to the next buffer
nmap <leader>k :bnext<CR>

" Move to the previous buffer
nmap <leader>j :bprevious<CR>

" Competitive Programming
" autocmd filetype cpp nnoremap <F4> <Esc>:tabnew input.txt<CR>
" autocmd filetype cpp nnoremap <F5> <Esc>:w!<CR>:!clear; g++ % -o %:r -std=c++14 -Wall<CR>
" autocmd filetype cpp nnoremap <F6> <Esc>:!clear; ./%:r < input.txt<CR>
" autocmd filetype javascript nnoremap <F4> <Esc>:tabnew input.txt<CR>
" autocmd filetype javascript nnoremap <F5> <Esc>:w!<CR>:!clear; node % < input.txt<CR>
" autocmd filetype javascript nnoremap <F6> <Esc>:!clear; cat ~/.output<CR>
" autocmd filetype python nnoremap <F5> <Esc>:w!<CR>:!clear; python3 %<CR>

" Programming
" Run file
" autocmd filetype javascript nnoremap <F5> <Esc>:w!<CR>:!clear; node %<CR>
" autocmd filetype python nnoremap <F5> <Esc>:w!<CR>:!clear; python3 %<CR>
" autocmd filetype go nnoremap <F5> <Esc>:w!<CR>:!clear; go build % && ./%:r<CR>
" autocmd filetype java nnoremap <F5> <Esc>:w!<CR>:!clear; java %:r.class<CR>
" autocmd filetype cpp nnoremap <F5> <Esc>:!clear; ./%:r<CR>
" Compile
" autocmd filetype java nnoremap <F6> <Esc>:w!<CR>:!clear; javac %<CR>
" autocmd filetype cpp nnoremap <F6> <Esc>:w!<CR>:!clear; g++ % -o %:r -std=c++17 -Wall;<CR>
