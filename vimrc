"-------------General
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
set shiftwidth=4	" Number of auto-indent spaces
set smartindent	" Enable smart-indent
set smarttab	" Enable smart-tabs
set softtabstop=4	" Number of spaces per Tab
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


"---------Keybindings
" MAKE SURE NO TRAILING SPACES

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
"---------endKeybindings


"--------PLUGINS

call plug#begin()

Plug 'junegunn/goyo.vim'

call plug#end()

"--------ENDPLUGINS


" Word Processor Mode

func! WordProcessorMode()
    setlocal textwidth=80
    setlocal smartindent
    setlocal spell spelllang=en_us
    setlocal noexpandtab
endfu

com! WP call WordProcessorMode()
