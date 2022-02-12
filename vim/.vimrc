
set nocompatible

" before load goes here

set number
set backspace=indent,eol,start
set history=1000
set showcmd
set showmode
" set gcr=a:blinkon0
set visualbell
set autoread

set nobackup
set nowritebackup
set noswapfile
" set cursorline
set autochdir

" Spaces instead of tabs, default to 2
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab
" set hidden

set clipboard=unnamed

syntax on
let mapleader=","
" Plugins

syntax enable
set background=dark

set laststatus=2

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

" change shape of cursor in insert mode in iTerm 2
let s:iterm   = exists('$ITERM_PROFILE') || exists('$ITERM_SESSION_ID') || filereadable(expand("~/.vim/.assume-iterm"))
let s:tmux    = exists('$TMUX')

if s:iterm
  let start_insert  = "\<Esc>]50;CursorShape=1\x7"
  let end_insert    = "\<Esc>]50;CursorShape=0\x7"

  if s:tmux
   " let start_insert  = s:TmuxWrap(start_insert)
   " let end_insert    = s:TmuxWrap(end_insert)
  endif

  let &t_SI = start_insert
  let &t_EI = end_insert
 endif


" key mappings for switching between windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright
