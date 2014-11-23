execute pathogen#infect()
syntax on

let mapleader=","
set timeoutlen=1500

set smartcase
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set nu
set ruler
set cmdheight=2
set hlsearch
set ignorecase
set nobackup
set nowb
set noswapfile

set expandtab
set smarttab

set shiftwidth=4
set tabstop=4

nmap <F2> :update<CR>
vmap <F2> <Esc><F2>gv
imap <F2> <c-o><F2>
:command WQ wq
:command Wq wq
:command W w
:command Q q
vmap <C-C> "+y
map <C-V> "+p
smap <C-p> <Plug>ActivateQS
let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_prev_key='<C-D>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

map <C-k> dd

set autoindent
set ai
set showcmd
set incsearch
set autochdir
set backspace=2
set nocompatible
set autoread
set ffs=unix,dos,mac
set noconfirm
set history=1000
set noshowmatch
colorscheme desert
set background=dark
set guifont=DejaVu_Sans_Mono:h14:cANSI


set pastetoggle=<F11>
set mouse=a

filetype plugin on
filetype indent on

set clipboard=unnamedplus
set mouse-=a

