 
 " Vim settings for @mscoutermarsh
 "

 " Settings in this file may depend on plugins, so let's install them first.
 " Not to be confused with the contents of ~/.vim/plugin/* which are
 " configuration options for each plugin and automatically loaded by Vim.

"Open NerdTree on startup
autocmd VimEnter * NERDTree
 " Go to previous (last accessed) window.
autocmd VimEnter * wincmd p

syntax on
autocmd Filetype scss if getfsize(@%) > 300 | setlocal syntax=OFF | endif


set autoread                          " Auto reload changed files
set wildmenu                          " Tab autocomplete in command mode
set backspace=indent,eol,start        " http://vi.stackexchange.com/a/2163
set clipboard=unnamed                 " Clipboard support (OSX)
set laststatus=2                      " Show status line on startup
set splitright                        " Open new splits to the right
set splitbelow                        " Open new splits to the bottom
set lazyredraw                        " Reduce the redraw frequency
set ttyfast                           " Send more characters in fast
set nobackup nowritebackup noswapfile " Turn off backup files
set noerrorbells novisualbell         " Turn off visual and audible bells
set expandtab shiftwidth=2 tabstop=2  " Two spaces for tabs everywhere
set history=500
set hlsearch                          " Highlight search results
set ignorecase smartcase              " Search queries intelligently set
set incsearch                         " Show search results as you type
set timeoutlen=1000 ttimeoutlen=0     " Remove timeout when hitting escape
set showcmd                           " Show size of visual selection

 " Persistent undo
set undodir=~/.vim/undo/
set undofile
set undolevels=1000
set undoreload=10000

 " Ignored files/directories from autocomplete (and CtrlP)
set wildignore+=*/tmp/*
set wildignore+=*.so
set wildignore+=*.zip
set wildignore+=*/vendor/bundle/*
set wildignore+=*/node_modules/

 "-------------------------------------------------------------------------------
 " Interface
 "-------------------------------------------------------------------------------

set number            " Enable line numbers
set scrolloff=5       " Leave 5 lines of buffer when scrolling
set sidescrolloff=10  " Leave 10 characters of horizontal buffer when

colorscheme monokai_pro

 " Showcase comments in italics
highlight Comment cterm=italic gui=italic

 " Easy tab navigation
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

 " CtrlP use FZF (faster!)
nnoremap <C-p> :Files<Cr>

set pastetoggle=<F10>

let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_in_insert_mode = 0 " do not save in insert mode

 " Get off my lawn - helpful when learning Vim :)
 nnoremap <Left> :echoe "Use h"<CR>
 nnoremap <Right> :echoe "Use l"<CR>
 nnoremap <Up> :echoe "Use k"<CR>
 nnoremap <Down> :echoe "Use j"<CR>

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree.git'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'reedes/vim-wordy'
Plug 'Ron89/thesaurus_query.vim'
Plug 'junegunn/limelight.vim'

" Initialize plugin system
call plug#end()

map <F2> :setlocal spell! spelllang=en_gb<CR>
map <F5> :ThesaurusQueryReplaceCurrentWord<CR>
map <F3> :WP<CR>

" Word Processing Function!
func! WordProcessorMode()
 setlocal noexpandtab
 execute "Limelight 0.5"
 map j gj
 map k gk
 setlocal spell spelllang=en_gb
 set complete+=s
 set formatprg=par
 setlocal wrap
 setlocal linebreak
 set textwidth=79
 set fo+=t
 set fo-=l
 endfu
com! WP call WordProcessorMode()

