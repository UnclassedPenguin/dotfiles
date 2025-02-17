"-------------------------------------------------------------------------------
"-------------------------------------------------------------------------------
"
" Tyler(UnclassedPenguin) .vimrc 2022
"
" Author: Tyler(UnclassedPenguin)
"    URL: https://unclassed.ca
" GitHub: https://github.com/UnclassedPenguin
"
"-------------------------------------------------------------------------------
"-------------------------------------------------------------------------------


"--------------------------------------"
"-------------General------------------"
"--------------------------------------"

set nocompatible                " Disable compatible mode with vi
let mapleader = " "             " Map leader to space
let maplocalleader = "\\"

filetype on
syntax on                       " Turn syntax on
"set showbreak=+++              " Wrap-broken line prefix
"set showbreak=+                 " Wrap-broken line prefix
set showmatch                   " Highlight matching brace
set hlsearch                    " highlight all search results
set smartcase                   " enable smart-case search
set ignorecase	                " Always case-insensitive
set incsearch                   " Searches for strings incrementally
set autoindent                  " Auto-indent new lines
set smartindent	                " Enable smart-indent
set expandtab                   " Use spaces instead of tabs
set shiftwidth=2                " Number of auto-indent spaces
set smarttab                    " Enable smart-tabs
set softtabstop=2               " Number of spaces per Tab
set noerrorbells                " Turn off error bells
set ruler                       " Show row and column ruler information
set undolevels=1000             " Number of undo levels
set backspace=indent,eol,start  " Backspace behaviour
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

" Remember where you are in a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

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

" Switch window (ie after opening :term)
tnoremap <leader>bw <C-W><C-W>
nnoremap <leader>bw <C-W><C-W>

" Remaps for moving between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Centers cursor to screen when scrolling by half pages
nnoremap <C-D> <C-D>zz
nnoremap <C-U> <C-U>zz

" open ~/.vimrc in buffer
map <leader>ev :e ~/.vimrc<CR>

" open ~/.todo.txt in buffer
map <leader>td :e ~/.todo/todo.txt<CR>

" Turns off highlighting
map <leader>h :noh<CR>

" <space>ss will toggle spellcheck
map <leader>ss :setlocal spell!<cr>

" Open Nerd Tree
map <leader>nt :NERDTreeToggle<CR>

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

" Open terminal
map <leader>tt :term<CR>

" Autoformat
map <leader>af :Autoformat<CR>

" Markdown start webserver
map <leader>ms :InstantMarkdownPreview<CR>
" Markdown stop webserver
map <leader>mt :InstantMarkdownStop<CR>

" Writing mode
map <leader>wp :WP<CR>

" Python Folding
map <leader>ff :set foldmethod=indent<CR>
" Open single fold recursively
map <leader>fo zO
" Open all folds
map <leader>fa zR
" Close single fold
map <leader>fc zc
" Close all folds
map <leader>fm zM

"--------------------------------------"
"--------ENDKEYBINDINGS----------------"
"--------------------------------------"


"--------------------------------------"
"--------PLUGINS-----------------------"
"--------------------------------------"

" I use vim-plug to manage plugins.
" Install using:
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" Then open vim and run :PlugInstall

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

" Todo plugin
Plug 'laib3/vim-todo-plugin'


" Python folding
" Plug 'tmhedberg/SimpylFold'

" For incrementing numbers
Plug 'triglav/vim-visual-increment'

call plug#end()

"--------------------------------------"
"--------ENDPLUGINS--------------------"
"--------------------------------------"


"--------------------------------------"
"--------FUNCTIONS---------------------"
"--------------------------------------"

func! WordProcessorMode()
    :Goyo
    setlocal smartindent
    setlocal spell spelllang=en_us
    setlocal noexpandtab
endfu

com! WP call WordProcessorMode()

"--------------------------------------"
"--------ENDFUNCTIONS------------------"
"--------------------------------------"


" Basic Status line
set laststatus=2
set statusline=
set statusline +=%1*\ %n\ %*            " Buffer number
set statusline +=%5*%{&ff}%*            " File format
set statusline +=%3*%y%*                " File type
set statusline +=%4*\ %<%F%*            " Full path
set statusline +=%2*%m%*                " Modified flag
set statusline +=%1*%=%5l%*             " Current line
set statusline +=%2*/%L%*               " Total lines
set statusline +=%1*%4v\ %*             " Virtual column number
set statusline +=%2*0x%04B\ %*          " Character under cursor
