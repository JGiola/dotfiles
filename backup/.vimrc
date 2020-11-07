"Using vim as vim
set nocompatible

"Change mapleader
let mapleader=","

"Line numbers are good
set number
"Enable syntax highlighting
syntax on
"Enhance command-line completion
set wildmenu
"Allow backspace in insert mode
set backspace=indent,eol,start
"Store lots of :cmdline history
set history=50
"Show incomplete cmds down the bottom
set showcmd
"Show current mode down the bottom
set showmode
"No sounds
set visualbell
"Allow cursor keys in insert mode
set esckeys
"Enable mouse in all modes
set mouse=a

"Set colum with to 100
set colorcolumn=100
"Highlight current line
set cursorline
"Use UTF-8
set encoding=utf-8
"Don't wrap lines
set nowrap
"Wrap lines at convenient points
set linebreak
"Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list

"Use 2 spaces to a tab
set tabstop=2
"As above
set shiftwidth=2
"Expand tabs into spaces
set expandtab

"Highlight searches
set hlsearch
"Ignore case of searches
set ignorecase
"Highlight dynamically as pattern is typed
set incsearch

"Optimize for fast terminal connections
set ttyfast

"Stupid shift key is stupid
cnoreabbrev W w
cnoreabbrev X x
cnoreabbrev Xa xa
cnoreabbrev Q q
cnoreabbrev Wq wq
cnoreabbrev WQ wq

"Why Y is not as C and D?
nnoremap Y y$

"When searching for things, keep the current match in the middle of the window and pulse the line when moving to them
nnoremap n nzzzv
nnoremap N Nzzzv

"Reload files changed outside vim
set autoread

"Disable all tipe of backup
set noswapfile
set nobackup
set nowritebackup

"Strip trailing whitespace (,ss)
function! StripWhitespace()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

if has("unix")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    set clipboard=unnamed
  else
    set clipboard=unnamedplus
  endif
endif
