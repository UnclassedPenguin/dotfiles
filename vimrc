"--------------------------------------"
"-------------General------------------"
"--------------------------------------"

let mapleader = " "             " Map leader to space

syntax on                       " Turn syntax on
set nocompatible                " Disable compatible mode with vi
set showbreak=+++ 	        " Wrap-broken line prefix
set showmatch	                " Highlight matching brace
set hlsearch	                " highlight all search results
set smartcase	                " enable smart-case search
set ignorecase	                " Always case-insensitive
set incsearch	                " Searches for strings incrementally
set autoindent	                " Auto-indent new lines
set expandtab	                " Use spaces instead of tabs
set shiftwidth=2	        " Number of auto-indent spaces
set smartindent	                " Enable smart-indent
set smarttab	                " Enable smart-tabs
set softtabstop=2	        " Number of spaces per Tab
set noerrorbells                " Turn off error bells
set ruler	                " Show row and column ruler information
set undolevels=1000	        " Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour
set wrap                        " Turn on text wrap
set linebreak
set textwidth=0
set wrapmargin=0
set formatoptions+=l
set splitbelow                  " Split screen to bottom
set splitright                  " Split screen to right

"--------------------------------------"
"----------ENDGENERAL------------------"
"--------------------------------------"


"--------------------------------------"
"----------ADVANCED--------------------"
"--------------------------------------"

" Sets Airline Theme
" let g:airline_theme='bubblegum'

" Disable autostart for markdown viewer
let g:instant_markdown_autostart = 0

"--------------------------------------"
"----------ENDADVANCED-----------------"
"--------------------------------------"


"--------------------------------------"
"---------KEYBINDINGS------------------"
"--------------------------------------"
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

" open ~/.vimrc in buffer
map <leader>ev :e ~/.vimrc<CR>

" Turns off highlighting
map <leader>h :noh<CR>

" <space>ss will toggle spellcheck
map <leader>ss :setlocal spell!<cr>

" Open Nerd Tree
map <leader>nt :NERDTree<CR>

"----------------------"
"------Buffer CMDs-----"
"----------------------"
" List Buffer
map <leader>bl :buffers<CR>

" Next Buffer
map <leader>bn :bn<CR>

" Delete current buffer
map <leader>bd :bd<CR>

" Split horizontally
map <leader>bh :split<CR>

" Split vertically
map <leader>bv :vsplit<CR>
"----------------------"
"------EndBuffer CMDs--"
"----------------------"

"----------------------"
"------Tab CMDs--------"
"----------------------"
" Create New Tab ([t]ab [c]reate)
map <leader>tc :tab new<CR>

" Next Tab ([t]ab [n]ext)
map <leader>tn :tabn<CR>

" Previous Tab ([t]ab [p]revious)
map <leader>tp :tabp<CR>
"----------------------"
"------EndTab CMDs-----"
"----------------------"

" Autoformat
map <leader>af :Autoformat<CR>

" Markdown start webserver
map <leader>ms :InstantMarkdownPreview<CR>
" Markdown stop webserver
map <leader>mt :InstantMarkdownStop<CR>

"--------------------------------------"
"--------ENDKEYBINDINGS----------------"
"--------------------------------------"


"--------------------------------------"
"--------PLUGINS-----------------------"
"--------------------------------------"

"I use vim-plug to manage plugins.
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
" Also installed tidy (for html) and yapf (for python) if you uninstall
" sudo apt uninstall tidy
" python3 uninstall yapf
Plug 'Chiel92/vim-autoformat'

" Status Line // Seems kinda Slow...
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

" Markdown viewer
" Had to install instant-markdown-d to make it work. If you uninstall:
" make sure to also: npm uninstall instant-markdown-d
Plug 'instant-markdown/vim-instant-markdown'

" Match html tags
Plug 'Valloric/matchtagalways'

" Vim terminal
" Dont reqlly like this one...
" Plug 'tc50cal/vim-terminal'

call plug#end()

"--------------------------------------"
"--------ENDPLUGINS--------------------"
"--------------------------------------"
"
" Basic Status line
set laststatus=2
set statusline=
set statusline +=%1*\ %n\ %*            "buffer number
set statusline +=%5*%{&ff}%*            "file format
set statusline +=%3*%y%*                "file type
set statusline +=%4*\ %<%F%*            "full path
set statusline +=%2*%m%*                "modified flag
set statusline +=%1*%=%5l%*             "current line
set statusline +=%2*/%L%*               "total lines
set statusline +=%1*%4v\ %*             "virtual column number
set statusline +=%2*0x%04B\ %*          "character under cursor
