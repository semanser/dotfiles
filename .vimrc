"""""""""""""
"
" PLUGINS
"
"""""""""""""
call plug#begin('~/.vim/plugged')
  Plug 'Raimondi/delimitMate'                                              " Provides insert mode auto-completion for quotes, parens, brackets, etc
  Plug 'Valloric/MatchTagAlways'                                           " Always highlights the enclosing html/xml tags
  Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' } " A code-completion engine
  Plug 'airblade/vim-gitgutter'                                            " Shows a git diff in the gutter (sign column) and stages/undoes hunks
  Plug 'alvan/vim-closetag'                                                " Auto close (X)HTML tags
  Plug 'ap/vim-css-color'                                                  " Preview colours in source code while editing
  Plug 'easymotion/vim-easymotion'                                         " A much simpler way to use some motions in vim
  Plug 'hail2u/vim-css3-syntax'                                            " CSS3 syntax (and syntax defined in some foreign specifications) support for Vim's built-in syntax/css.vim
  Plug 'haya14busa/incsearch.vim'                                          " Improved incremental searching for Vim
  Plug 'heavenshell/vim-jsdoc'                                             " Generate JSDoc to your JavaScript code
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }        " A command-line fuzzy finder
  Plug 'junegunn/fzf.vim'                                                  " fzf bindings for vim
  Plug 'junegunn/vim-easy-align'                                           " A Vim alignment plugin
  Plug 'lambdalisue/gina.vim'                                              " Asynchronously control git repositories in Neovim/Vim 8
  Plug 'mhinz/vim-startify'                                                " The fancy start screen for Vim.
  Plug 'morhetz/gruvbox'                                                   " Retro groove color scheme for Vim
  Plug 'mxw/vim-jsx'                                                       " React JSX syntax highlighting and indenting for vim
  Plug 'othree/es.next.syntax.vim'                                         " ES.Next syntax for Vim
  Plug 'othree/yajs.vim'                                                   " YAJS.vim: Yet Another JavaScript Syntax for Vim
  Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}                     " A tree explorer plugin for vim
  Plug 'szw/vim-g'                                                         " Quick Google lookup directly from Vim
  Plug 'tpope/vim-commentary'                                              " Comment stuff out
  Plug 'tpope/vim-surround'                                                " Quoting/parenthesizing made simple
  Plug 'vim-airline/vim-airline'                                           " Lean & mean status/tabline for vim that's light as air
  Plug 'w0rp/ale'                                                          " Asynchronous Lint Engine
call plug#end()



"""""""""""""
"
" GENERAL
"
"""""""""""""
cd /Users/semanser/Desktop/Programming " Setup working directory
colorscheme gruvbox                    " Setup color scheme
let mapleader = "\<Space>"             " Setup leader key
syntax enable                          " Enable syntax highlighting



""""""""""""""
"
" VARS
"
""""""""""""""
set autoread             " autoload file changes
set autowriteall         " autosave files
set background=dark      " dark colorscheme One
set completeopt-=preview " Do not show preview window for ins-completion.
set encoding=utf-8       " set the character encoding to UTF-8
set expandtab            " convert tabs to the spaces
set foldlevel=2          " sets the fold level
set foldmethod=indent    " type of indentation
set foldnestmax=10       " sets the maximum nesting of folds
set gcr=a:blinkon0       " disable cursor blinking
set guioptions=          " remove all GUI components and options.
set hidden               " hide when switching buffers instead of unloading
set history=1000         " store lots of :cmdline history
set hlsearch             " highlights the string matched by the search
set ignorecase           " make searching case insensitive
set incsearch            " incremental search
set lazyredraw           " only redraw when necessary
set nobackup             " disable backups
set nocompatible         " use Vim settings, rather then Vi
set nofoldenable         " when off, all folds are open when open a new file
set noshowmode           " don't show mode as we use a status line plugin
set noswapfile           " disable swapfile
set nowrap               " wrap lines
set number               " show line number
set relativenumber       " make relative line number
set scrolloff=9999       " keep cursor at the center of the screen
set shiftwidth=2         " 2 spaces
set showcmd              " show (partial) command in status line
set showmatch            " show match brackets
set sidescroll=1         " incrementally scroll one character
set smartcase            " unless the query has capital letters
set splitbelow           " open new split below
set splitright           " open new split right
set tabstop=2            " 2 spaces
set termguicolors        " enable True color
set ttyfast              " always assume a fast terminal
set wildmenu             " visual autocomplete for command menu



""""""""""""
"
" KEYMAP
"
""""""""""""
imap <C-c> <CR><Esc>O
map /  <Plug>(incsearch-forward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <silent> <D-1> :tabn 1<cr>
map <silent> <D-2> :tabn 2<cr>
map <silent> <D-3> :tabn 3<cr>
map <silent> <D-4> :tabn 4<cr>
map <silent> <D-5> :tabn 5<cr>
map <silent> <D-6> :tabn 6<cr>
map <silent> <D-7> :tabn 7<cr>
map <silent> <D-8> :tabn 8<cr>
map <silent> <D-9> :tabn 9<cr>
map <silent> <tab> :NERDTreeToggle<CR>
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
nmap <C-S-P> :call <SID>SynStack()<CR>
nmap ga <Plug>(EasyAlign)
nmap s <Plug>(easymotion-overwin-f2)
nmap ¬ :bnext<CR>
nmap ˙ :bprevious<CR>
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
nnoremap <esc> :noh<return><esc>
nnoremap <silent> <leader><tab> :Files<CR>
nnoremap <silent> <leader>ga :Gina add .<CR>
nnoremap <silent> <leader>gc :Gina commit<CR>
nnoremap <silent> <leader>gp :Gina push<CR>
nnoremap <silent> <leader>t :term<CR>
tnoremap <Esc> <C-\><C-n>
vmap <leader>s :sort<CR>
xmap ga <Plug>(EasyAlign)



"""""""""""""
" 
" AUTOCOMMANDS
"
"""""""""""""
au TermOpen * setlocal nonumber norelativenumber



"""""""""""""
"
" FUNCTIONS
"
"""""""""""""
" Show syntax highlighting groups for word under cursor (needed for theme development)
function! <SID>SynStack() 
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc



"""""""""""""
"
" PLUGINS SETTINGS
"
"""""""""""""

" 
" NERDTree
"
let NERDTreeShowHidden=1

" 
" ale
"
let g:ale_linters = {
\   'javascript': ['eslint'],
\}

" 
" vim-closetag
"
let g:closetag_close_shortcut = ''
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*jsx'

" 
" fzf
"
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" 
" vim-jsx
"
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

"
" vim-easymotion
"
let g:EasyMotion_smartcase = 1 " Turn on case insensitive feature

"
" delimitMate
"
let delimitMate_expand_cr = 1 " autoindent on carriage return

"
" airline
"
" let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_close_button= 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z = ''
let g:airline_theme='gruvbox'

"
" YouCompleteMe
"
let g:ycm_autoclose_preview_window_after_insertion = 1

