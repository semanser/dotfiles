set showcmd             " Show (partial) command in status line
set showmatch           " Show matching brackets.
set number 		" Show line numbe
set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

syntax on
color dracula

Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'mhinz/vim-signify'
Plug 'jreybert/vimagit'
Plug 'tpope/vim-fugitive'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
Plug 'pangloss/vim-javascript'
Plug 'yuttie/comfortable-motion.vim'

" NERDTree
map <C-n> :NERDTreeToggle<CR>

" fzf
let mapleader = "\<Space>"
nnoremap <silent> <leader><space> :Files<CR>

"Initialize plugin system
call plug#end()

set relativenumber

set scrolloff=9999 " keep cursor at the center of the screen

" highlight WordUnder ctermbg = DarkGray
" autocmd CursorMoved * exe printf('match WordUnder /\V\<%s\>/', escape(expand('<cword>'), '/\'))

set showmatch
hi MatchParen cterm=none ctermbg=green ctermfg=blue

autocmd CursorHold * update

" Showing trailing spaces
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/

" Convert tabs to the spaces
set expandtab
set tabstop=2
set shiftwidth=2

" Move between buffers
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-H> <C-W>h
nnoremap <C-L> <C-W>l

let laststatus=2

let g:javascript_plugin_jsdoc = 1

hi Pmenu ctermfg=NONE ctermbg=241 cterm=NONE guifg=NONE guibg=#64697a gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=105 cterm=NONE guifg=NONE guibg=#95bc07 gui=NONE

set termguicolors
