" ----------------------
" Reload vimrc on save
" ----------------------
autocmd! bufwritepost .vimrc source %

" ----------------------
" Filetype options
" ----------------------
autocmd FileType c setlocal ts=8 sts=8 sw=8 noexpandtab
autocmd FileType c++ setlocal ts=2 sts=2 sw=2 noexpandtab
autocmd FileType erlang setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType go setlocal ts=8 sts=8 sw=8 noexpandtab
autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab

" ----------------------
" Global options
" ----------------------
syntax on
filetype plugin indent on
set autochdir
syntax on
set background=dark
set ruler                     " show the line number on the bar
set more                      " use more prompt
set autoread                  " watch for file changes
set number                    " line numbers
set hidden
set noautowrite               " don't automagically write on :next
set lazyredraw                " don't redraw when don't have to
set showmode
set showcmd
set nocompatible              " vim, not vi
set autoindent smartindent    " auto/smart indent
set smarttab                  " tab and backspace are smart
set tabstop=2                 " 6 spaces
set shiftwidth=2
set scrolloff=5               " keep at least 5 lines above/below
set sidescrolloff=5           " keep at least 5 lines left/right
set history=200
set backspace=indent,eol,start
set linebreak
set cmdheight=2               " command line two lines high
set undolevels=1000           " 1000 undos
set updatecount=100           " switch every 100 chars
set complete=.,w,b,u,U,t,i,d  " do lots of scanning on tab completion
set ttyfast                   " we have a fast terminal
set noerrorbells              " No error bells please
set shell=bash
set fileformats=unix
set ff=unix
filetype on                   " Enable filetype detection
filetype indent on            " Enable filetype-specific indenting
filetype plugin on            " Enable filetype-specific plugins
set wildmode=longest:full
set wildmenu                  " menu has tab completion
let maplocalleader=','        " all my macros start with ,
set laststatus=2

"  searching
set incsearch                 " incremental search
set ignorecase                " search ignoring case
set hlsearch                  " highlight the search
set showmatch                 " show matching bracket
set diffopt=filler,iwhite     " ignore all whitespace and sync

"  backup
set nobackup
set viminfo=%100,'100,/100,h,\"500,:100,n~/.viminfo
"set viminfo='100,f1

" spelling
if v:version >= 700
  " Enable spell check for text files
  autocmd BufNewFile,BufRead *.txt setlocal spell spelllang=en
endif

" ----------------------
" Default key mappings
" ----------------------
let mapleader=","
set timeoutlen=1500

" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x
" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y
" CTRL-V and SHIFT-Insert are Paste
map <C-V> "+gP
map <S-Insert> "+gP
cmap <C-V> <C-R>+
cmap <S-Insert> <C-R>+
exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']
imap <S-Insert> <C-V>
vmap <S-Insert> <C-V>
noremap <C-O> <C-V>

nmap <F2> :update<CR>
vmap <F2> <Esc><F2>gv
imap <F2> <c-o><F2>
map <F3> :w<Enter>
map <F4> :wq!<Enter>
map <F5> gg=G
map <C-k> dd
map <C-t> :tabnew .<Enter>
map <C-w> :bdelete<Enter>
map <C-h> :s/
map <leader>[ :tabprev<CR>
map <leader>] :tabnext<CR>

" Easier window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Map j and k to work with wrapped lines
nnoremap j gj
nnoremap k gk

nmap <leader>t :enew<cr>
nmap <leader>l :tabnext<CR>
nmap <leader>h :tabprev<CR>
nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>
