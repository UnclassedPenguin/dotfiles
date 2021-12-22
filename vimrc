"-------------General
"--------------------
let mapleader = " " "map leader to space

syntax on
set showbreak=+++ 	" Wrap-broken line prefix
set showmatch	" Highlight matching brace
set hlsearch	" Highlight all search results
set smartcase	" Enable smart-case search
set ignorecase	" Always case-insensitive
set incsearch	" Searches for strings incrementally
set autoindent	" Auto-indent new lines
set expandtab	" Use spaces instead of tabs
set shiftwidth=2	" Number of auto-indent spaces
set smartindent	" Enable smart-indent
set smarttab	" Enable smart-tabs
set softtabstop=2	" Number of spaces per Tab
set noerrorbells
set ruler	" Show row and column ruler information
set undolevels=1000	" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour
set ai
set si
set wrap
set linebreak
set textwidth=0
set wrapmargin=0
set formatoptions+=l
set splitbelow " Split screen to bottom
set splitright " Split screen to right

filetype plugin indent on

"--------------------
"----------EndGeneral

"---------Keybindings
"--------------------
" MAKE SURE NO TRAILING SPACES

" Remap esc
inoremap jk <ESC>

" Remap for goyo, lets you go by visual line instead of by actual line
nnoremap j gj
nnoremap k gk

" Remaps for moving between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Turns off highlighting
map <leader>h :noh<CR>

" <space>ss will toggle spellcheck
map <leader>ss :setlocal spell!<cr>

" Turns on WordProcessor mode (See below)
map <leader>wp :WP<CR>

" Open Nerd Tree
map <leader>nt :NERDTree<CR>

" Split horizontally
map <leader>bh :split<CR>

" Split vertically
map <leader>bv :vsplit<CR>

" Autoindent
map <leader>ai :Autoformat<CR>
"-----------------------
"---------endKeybindings


"--------PLUGINS
"---------------
call plug#begin()

" Writing mode (:Goyo)
Plug 'junegunn/goyo.vim'

" Comment selected text (<leader> c space)
Plug 'preservim/nerdcommenter'

" File explorer (<leader> nt)
Plug 'preservim/nerdtree'

" Tabular for tabbing things...
Plug 'godlygeek/tabular'

" Autoformat
Plug 'Chiel92/vim-autoformat'

call plug#end()

"------------------
"--------ENDPLUGINS
