set showcmd             " Show (partial) command in status line
set showmatch           " Show matching brackets.
set number 		" Show line numbe
set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

syntax on

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
Plug 'mxw/vim-jsx'
Plug 'yuttie/comfortable-motion.vim'
Plug 'rakr/vim-one'
Plug 'valloric/MatchTagAlways'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'alvan/vim-closetag'
Plug 'easymotion/vim-easymotion'

" fzf
let mapleader = "\<Space>"
nnoremap <silent> <leader><tab> :Files<CR>
imap <C-c> <CR><Esc>O

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <leader>h :nohl<CR>

call plug#end()

"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

colorscheme one
set background=dark

" NERDTree
map <Leader>n :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

set relativenumber
set scrolloff=9999 " keep cursor at the center of the screen

" highlight WordUnder ctermbg = DarkGray
" autocmd CursorMoved * exe printf('match WordUnder /\V\<%s\>/', escape(expand('<cword>'), '/\'))

set showmatch
hi MatchParen cterm=bold ctermbg=green ctermfg=blue

autocmd CursorHold * update
" Showing trailing spaces :highlight ExtraWhitespace ctermbg=red guibg=red :match ExtraWhitespace /\s\+$/

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
set splitbelow
set splitright
set autoread

augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

" For local replace
nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>

" For global replace
nnoremap gR gD:%s/<C-R>///gc<left><left><left>

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*jsx'

let g:jsx_ext_required = 0 " Let vim-jsx handle JSX in `.js` files.

let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'javascript.jsx' : 1,
    \ 'jinja' : 1,
    \ 'liquid' : 1,
    \ 'markdown' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \}


" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

map <Leader>w :w<CR>
map <Leader>q :q<CR>

