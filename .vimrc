execute pathogen#infect()

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

let g:airline#extensions#tabline#enabled=1
let g:erlangFoldSplitFunction=0

" ----------------------
" Global options
" ----------------------
syntax on
filetype plugin indent on
set clipboard=unnamedplus
set mouse=a
set smartcase
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set nu
set rnu
set ruler
set cmdheight=1
set hlsearch
set ignorecase
set nobackup
set nowb
set noswapfile
set cursorline
set viminfo=
set laststatus=2
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
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
set t_Co=256
set wildmenu " display options for tab completion in command mode
set wildmode=list:longest

" Commands
:command WQ wq
:command Wq wq
:command W w
:command Q q

" ----------------------
" Default key mappings
" ----------------------
let mapleader=","
set timeoutlen=1500

nmap <F2> :update<CR>
vmap <F2> <Esc><F2>gv
imap <F2> <c-o><F2>
map <F4> :wq!<Enter>
vmap <C-C> "+y
map <C-V> "+p
smap <C-p> <Plug>ActivateQS
map <C-k> dd

" ----------------------
" Plugin options
" ----------------------
" multicursor
let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_prev_key='<C-D>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'


" Powerline
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
let g:Powerline_mode_V="V·LINE"
let g:Powerline_mode_cv="V·BLOCK"
let g:Powerline_mode_S="S·LINE"
let g:Powerline_mode_cs="S·BLOCK"

" Solarized
colorscheme solarized
let g:solarized_termcolors=256
let g:solarized_termtrans=1

hi statusline ctermbg=green ctermfg=black cterm=none
hi statuslinenc ctermbg=black ctermfg=green cterm=none
hi vertsplit ctermbg=black ctermfg=black cterm=none

" Gvim
set background=dark
set guioptions-=r 
set guifont=Liberation_Mono_for_Powerline:h11
"set guifont=Droid_Sans_Mono:h16:cANSI

" ----------------------
" Miscellaneous
" ----------------------

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


