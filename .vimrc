execute pathogen#infect()
syntax on

autocmd FileType c setlocal ts=8 sts=8 sw=8 noexpandtab
autocmd FileType c++ setlocal ts=2 sts=2 sw=2 noexpandtab
autocmd FileType erlang setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType go setlocal ts=8 sts=8 sw=8 noexpandtab
autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab

let g:erlangFoldSplitFunction=0

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
set cursorline
set viminfo=

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
set guioptions-=r 
set t_Co=256
set bg=dark
set guifont=Droid_Sans_Mono:h14:cANSI


set pastetoggle=<F11>
set mouse=a

filetype plugin on
filetype indent on

set clipboard=unnamedplus
set mouse-=a

colorscheme solarized
hi statusline ctermbg=green ctermfg=black cterm=none
hi statuslinenc ctermbg=black ctermfg=green cterm=none
hi vertsplit ctermbg=black ctermfg=black cterm=none

set wildmenu " display options for tab completion in command mode
set wildmode=list:longest

" Strip trailing whitespace
nnoremap <leader>rstrip :call <SID>StripTrailingWhitespaces()<CR>

" Easier window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Map j and k to work with wrapped lines
nnoremap j gj
nnoremap k gk

function! <SID>StripTrailingWhitespaces()
  " Save last search and cursor position
  let _s=@/
  let l = line(".")
  let c = col(".")

  " Strip trailing whitespace, suppressing no-match error
  %s/\s\+$//e

  " Restore
  let @/=_s
  call cursor(l, c)
endfunction


