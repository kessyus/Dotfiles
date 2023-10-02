" Search for plug.vim if doesn't exist then download it.
if empty(glob('~/.dotfiles/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

"*** Plugins Start ***
call plug#begin('~/.dotfiles/.vim/plugged')

" Layout and Themes
Plug 'dracula/vim'
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'ap/vim-css-color'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'mhinz/vim-startify'

" Utility
Plug 'jiangmiao/auto-pairs'
Plug 'vifm/vifm.vim'
Plug 'unblevable/quick-scope'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'psliwka/vim-smoothie'

" Programming Language Support
Plug 'pangloss/vim-javascript'              " Javascript

" Git integrations
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

call plug#end()
" *** Plugins End ***

syntax on

colorscheme onedark
if !has('gui_running')
  set t_Co=256
endif

if (has("termguicolors"))
  set termguicolors
endif

"
" Settings
"
set noerrorbells                " No beeps
set number                      " Show line numbers
set relativenumber              " Relative line numbers 
set backspace=indent,eol,start  " Makes backspace key more powerful.
set showcmd                     " Show me what I'm typing
set showmode                    " Show current mode.
set title                       " Show title of the file on term window
set wildmenu
set mouse=a                     " Enable the use of the mouse
set shortmess+=A                " Don't show annoying msg when theres a swap file
set shortmess+=c                " Don't pass messages to ins-completion-menu
set noswapfile                  " Don't use swapfile
set nobackup                    " Don't create annoying backup files
set nowritebackup
set splitright                  " Split vertical windows right to the current windows
set splitbelow                  " Split horizontal windows below to the current windows
set encoding=utf-8              " Set default encoding to UTF-8
set autowrite                   " Automatically save before :next, :make etc.
set autochdir                   " Autochange working directory based on current file
set autoread                    " Automatically reread changed files without asking me anything
set laststatus=2
set hidden
set ruler                       " Show the cursor position all the time
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not when search pattern contains upper case characters
set path+=**                    " Search down into subfolders
set wildmenu                    " Display all matching files when tab complete
set updatetime=300
set ttyfast
set conceallevel=0              " do not hide markdown
set wrap                        " Make Vim to handle long lines nicely.
set textwidth=79
set formatoptions=qrn1
" Wrapping off whenever working on an HTML file
autocmd BufNewFile,BufRead *.html setlocal nowrap 
set autoindent                  " Copy indent from current line to the next line
set complete-=i
set showmatch                   " When a bracket is inserted show the match
set smarttab
set et
set tabstop=2                   " Number of spaces that a <Tab>
set shiftwidth=2                " Number of spaces to use for each step autoindent
set expandtab                   " Use the appropriate number of spaces


" Airline config
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='powerlineish'


" Git Gutter
set signcolumn=yes

nmap ]h <Plug>(GitGutterNextHunk) "same as default
nmap [h <Plug>(GitGutterPrevHunk) "same as default

nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)

let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '✹'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '-'
let g:gitgutter_sign_modified_removed = '-'


" Remap Personal Keyboard

map <Space> <Leader>

" Go to beginning or end of a line easier
noremap H 0
noremap L $

" Disable highlights
map <silent> <leader><CR> :noh<cr>>

" Useful for tabs
noremap <Tab> gT
noremap <S-Tab> gt
" Open file under cursor in new tab
nnoremap <leader>go <Esc><C-W>gF<CR>:tabm<CR>

" Vifm
"map <leader>fe :TabVifm<CR>
"map <leader>fv :VsplitVifm<CR>
"map <leader>fh :SplitVifm<CR>
"map <leader>fd :DiffVifm<CR>

" Competitive Programming
"autocmd filetype cpp nnoremap <F4> <Esc>:tabnew input.txt<CR>
"autocmd filetype cpp nnoremap <F5> <Esc>:w!<CR>:!clear; g++ % -o %:r -std=c++14 -Wall<CR>
"autocmd filetype cpp nnoremap <F6> <Esc>:!clear; ./%:r < input.txt<CR>

" Programming
"autocmd filetype python nnoremap <F5> <Esc>:w!<CR>:!clear; python3 %<CR>
"autocmd filetype go nnoremap <F5> <Esc>:w!<CR>:!clear; go build % && ./%:r<CR>
"autocmd filetype java nnoremap <F5> <Esc>:w!<CR>:!clear; javac %<CR>
" Compile
"autocmd filetype cpp nnoremap <F4> <Esc>:w!<CR>:!clear; g++ % -o %:r -std=c++17 -Wall;<CR>
" Run
"autocmd filetype cpp nnoremap <F5> <Esc>:!clear; ./%:r<CR>

" Direction keys for wrapped lines
nnoremap <silent> k gk
nnoremap <silent> j gj
nnoremap <silent> <Up> gk
nnoremap <silent> <Down> gj

" Tabs and Shift Tabs works like other editors
inoremap <s-tab> <c-d>
vnoremap <tab> >gv
vnoremap <S-Tab> <gv
