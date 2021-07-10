"
" Settings
"
set noerrorbells visualbell t_vb= " No beeps
set number                      " Show line numbers
set relativenumber              " Relative line numbers
set cursorline                  " Highlight current line
set list                        " Display unprintable characters f12 - switches
set listchars=tab:•\ ,trail:•,extends:»,precedes:« " Unprintable chars mapping
set backspace=indent,eol,start  " Makes backspace key more powerful.
set showcmd                     " Show me what I'm typing
set showmode                    " Show current mode.
set title                       " Show title of the file on term window
set wildmenu
set mouse+=a                     " Enable the use of the mouse
set shortmess+=c                " Don't pass messages to ins-completion-menu
set shortmess+=I                " Disable the default Vim startup message
set noswapfile                  " Don't use swapfile
set nobackup                    " Don't create annoying backup files
set nowritebackup
set splitright                  " Split vertical windows right to the current windows
set splitbelow                  " Split horizontal windows below to the current windows
set encoding=utf-8              " Set default encoding to UTF-8
set autowrite                   " Automatically save before :next, :make etc.
set autochdir                   " Autochange working directory based on current file
set autoread                    " Automatically reread changed files without asking me anything
set laststatus=2                " Always show the status line at bottom
set hidden
set ruler                       " Show the cursor position all the time
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not when search pattern contains upper case characters
set path+=**                    " Search down into subfolders
set wildmenu                    " Display all matching files when tab complete
set updatetime=300              " Better experience than its default 4000
set ttyfast
set conceallevel=0              " do not hide markdown
set wrap                        " Make Vim to handle long lines nicely.
set textwidth=80
set formatoptions=qrn1
set autoindent                  " Copy indent from current line to the next line
set smartindent                 " Reacts to the syntax of the code
set complete-=i
set showmatch                   " When a bracket is inserted show the match
set smarttab
set et
set tabstop=2                   " Number of spaces that a <Tab>
set shiftwidth=2                " Number of spaces to use for each step autoindent
set expandtab                   " Use the appropriate number of spaces
set splitbelow                  " Open new split panes to bottom
set splitright                  " Open new split panes to right
set foldenable                  " Enable folding
set foldmethod=manual           " Folding Method
set foldlevel=99                " All folds open when opening a file
set clipboard=unnamed           " Allow copy and paste from system clipboard
set comments=sl:/*,mb:\ *,elx:\ */ " Intelligent comments
set cmdheight=2                 " Better display for messages
" Wrapping off whenever working on an HTML file
autocmd BufNewFile,BufRead *.html setlocal nowrap
" Delete empty space from the end of lines on every save
autocmd BufWritePre * :%s/\s\+$//e

" iTerm2 transparency and cursor type
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
