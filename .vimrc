"
" vim plug
"
call plug#begin('~/.vim/plugged')
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'

" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" " `:help :Glaive` for usage.
Plug 'google/vim-glaive'

" vim-sensible - couple of sensible defaults
Plug 'tpope/vim-sensible'

" Git gutter
Plug 'airblade/vim-gitgutter'

" NerdTree
Plug 'scrooloose/nerdtree'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" BufKill
Plug 'qpkorr/vim-bufkill'

" Ctrl-P
Plug 'ctrlpvim/ctrlp.vim'

" YouCompleteMe
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

" Initialize plugin system
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always display the status line, even if only one window is displayed
set laststatus=2

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='luna'
let g:airline_powerline_fonts = 1

set t_Co=256

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set cc=80

" Colour scheme
colorscheme torte

" Spell checking (defaults to ON for all file types, scope below
if has("spell")
  autocmd BufRead,BufNewFile * setlocal spell spelllang=en_gb
endif

" Syntax highlighting, current we enable parsing from
" the start of the file as the syntax parser can sometimes get
" itself in knots.
syntax on
autocmd BufEnter * :syntax sync fromstart

" NERDTree options
let g:NERDTreeWinSize = 40
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

set mouse=a

set hidden

set wildmenu

set showcmd

set hlsearch

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled,
" keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent
set smartindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the
" status line of a window
set ruler

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

set shiftwidth=2
set softtabstop=2
set expandtab


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Glaive
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd VimEnter * Glaive codefmt clang_format_executable='/home/dan.hutchinson/tools/llvm/4.01/llvm/build_dir/bin/clang-format'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Bindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Strict vim navigation
noremap <up> <nop>
noremap <down> <nop>

noremap <F5> :buffers<CR>:buffer<Space>

" Fast switching between Windows
map <C-W> <C-W><C-W>

" Fast switching between buffers
map <left> :bprev<CR>
map <right> :bnext<CR>

" Yank a whole line
map Y y$

" Close buffer
map <C-k> :BD<CR>

" Quit
map Q :qall<CR>

