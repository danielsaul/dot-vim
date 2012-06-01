""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Configuration File
" ~/.vimrc
"
" Priyesh Patel
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ************************************************************************
" G E N E R A L
"

" Set mapleader
let mapleader = ","

" Forget compatibility with Vi.
set nocompatible

" Auto update $MYVIMRC
autocmd! bufwritepost .vimrc source $MYVIMRC
autocmd! bufwritepost vimrc source $MYVIMRC

" Spelling language
setlocal spelllang=en_gb

" ************************************************************************
" S Y N T A X
"

" Enable filetypes and syntax
filetype on
filetype plugin on
filetype indent on
syntax on

" Specific file types
" ActionScript
au BufEnter,BufNewFile,BufRead *.as setf actionscript
" Arduino
autocmd! BufNewFile,BufRead *.ino setlocal ft=arduino
" SCSS
au BufRead,BufNewFile *.scss set filetype=scss

" ************************************************************************
" T H E M E ,  L O O K  &  F E E L
"

" Show line, column and percentage through file
set ruler

" Show partial commands
set showcmd

" Hide the mouse
set mousehide

" Line numbers
set number

" Colorscheme
colors molokai

" Always show status line
set laststatus=2

" Minimum number of lines to keep above/below cursor if possible
set scrolloff=8

" Enable folds
set foldenable

" Place split windows below
set splitbelow

" Formatting options
set formatoptions=qrnc12

" ************************************************************************
" T A B S  &  S P A C I N G
"
set tabstop=4
set shiftwidth=4
set smartindent
set autoindent
set linespace=3
set expandtab
set softtabstop=4

" Line wrapping options
set wrap
set textwidth=0
set showbreak=>\ 

" ************************************************************************
" M A P P I N G S
"

" Vim IDE mappings
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Wrap all text
nnoremap <leader>q gqip

" F2 to toggle NERTTree
map <F2> :NERDTreeToggle<cr>

" Stop highlighting
nmap <silent> <F3> :noh<cr>

" Toggle unprintable characters
nmap <silent> <F4> :set list!<cr>

" Toggle spelling
map <F5> :set spell!<cr>

" Use spacebar to enter colon
nmap <space> :

" jj in insert mode escapes
imap jj <esc>

" Edit vimrc
nmap <leader>ev :e $MYVIMRC<cr>

" List buffers
nmap <leader>b :ls<cr>

" PHP documenter
inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i 
nnoremap <C-P> :call PhpDocSingle()<CR> 
vnoremap <C-P> :call PhpDocRange()<CR> 

" ************************************************************************
" M I S C
"

" Backups and swap files
set backupdir=$HOME/.vim/tmp/backup/ " backups
set directory=$HOME/.vim/tmp/swap/ " swap files
set backup " enable backup

" Auto change directory
set autochdir
cd ~/

" Change CD to that of the file in the buffer
autocmd BufEnter * cd %:p:h

" Show hidden files in NERDTree
let NERDTreeShowHidden=1

" More useful command-line completion
set wildmenu

" Auto-completion menu
set wildmode=list:longest

" What can I backspace over
set backspace=indent,eol,start

" Time out length in milliseconds
set timeoutlen=750

" Allow hiding of modified buffers
set hidden

" Searching
set hlsearch
set incsearch

" ************************************************************************
" W I N D O W S
"

if has("win32") || has("win64")
    " Backups and swap files
    set backupdir=$HOME/vimfiles/tmp/backup/ " backups
    set directory=$HOME/vimfiles/tmp/swap/ " swap files
    set backup " enable backup

    " Auto change directory
    cd C:\

    " Edit vimrc
    nmap <leader>ev :e $HOME/vimfiles/vimrc<cr>
endif

" ************************************************************************
" G V I M
"

if has("gui_running")
    " Font
    set guifont=Consolas:h11
    " Colorscheme
    colors molokai
    " Remove tab-bar and menu-bar
    set guioptions-=m
    set guioptions-=T
endif

" ************************************************************************
" T E R M I N A L
"

if !has("gui_running")
    " Colorscheme
    "highlight Normal ctermbg=black ctermfg=white
    " 256 colours in terminal
    set t_Co=256 
endif
