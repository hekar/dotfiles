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
set autochdir
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
set virtualedit=

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
map <F4> :wq!<Enter>
map <C-k> dd
map <C-t> :tabnew .<Enter>
map <C-w> :bdelete<Enter>
map <C-f> :/
map <C-h> :s/

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
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set guifont=Inconsolata\ 12

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

" Gvim
" Memorize screen size, position and such
set ssop+=resize,winpos,winsize,blank,buffers,curdir,folds,help,options,tabpages

if has("gui_running")
  function! ScreenFilename()
    if has('amiga')
      return "s:.vimsize"
    elseif has('win32')
      return $HOME.'\_vimsize'
    else
      return $HOME.'/.vimsize'
    endif
  endfunction

  function! ScreenRestore()
    " Restore window size (columns and lines) and position
    " from values stored in vimsize file.
    " Must set font first so columns and lines are based on font size.
    let f = ScreenFilename()
    if has("gui_running") && g:screen_size_restore_pos && filereadable(f)
      let vim_instance = (g:screen_size_by_vim_instance==1?(v:servername):'GVIM')
      for line in readfile(f)
        let sizepos = split(line)
        if len(sizepos) == 5 && sizepos[0] == vim_instance
          silent! execute "set columns=".sizepos[1]." lines=".sizepos[2]
          silent! execute "winpos ".sizepos[3]." ".sizepos[4]
          return
        endif
      endfor
    endif
  endfunction

  function! ScreenSave()
    " Save window size and position.
    if has("gui_running") && g:screen_size_restore_pos
      let vim_instance = (g:screen_size_by_vim_instance==1?(v:servername):'GVIM')
      let data = vim_instance . ' ' . &columns . ' ' . &lines . ' ' .
            \ (getwinposx()<0?0:getwinposx()) . ' ' .
            \ (getwinposy()<0?0:getwinposy())
      let f = ScreenFilename()
      if filereadable(f)
        let lines = readfile(f)
        call filter(lines, "v:val !~ '^" . vim_instance . "\\>'")
        call add(lines, data)
      else
        let lines = [data]
      endif
      call writefile(lines, f)
    endif
  endfunction

  if !exists('g:screen_size_restore_pos')
    let g:screen_size_restore_pos = 1
  endif
  if !exists('g:screen_size_by_vim_instance')
    let g:screen_size_by_vim_instance = 1
  endif
  autocmd VimEnter * if g:screen_size_restore_pos == 1 | call ScreenRestore() | endif
  autocmd VimLeavePre * if g:screen_size_restore_pos == 1 | call ScreenSave() | endif
endif

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'

set grepprg=ag\ --nogroup\ --nocolor
let g:ctrlp_user_command='ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching=0
let g:ctrlp_follow_symlinks=1

