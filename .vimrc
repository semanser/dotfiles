""""""""""""""""""
"
" PLUGINS SETUP
"
""""""""""""""""""
call plug#begin('~/.vim/plugged')
  " Provides insert mode auto-completion for quotes, parens, brackets, etc
  Plug 'Raimondi/delimitMate'
  let delimitMate_expand_cr = 1

  " Always highlights the enclosing html/xml tags
  Plug 'Valloric/MatchTagAlways'

  " A code-completion engine
  Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
  let g:ycm_autoclose_preview_window_after_insertion = 1

  " Shows a git diff in the gutter (sign column) and stages/undoes hunks
  Plug 'airblade/vim-gitgutter'

  " Auto close (X)HTML tags
  Plug 'alvan/vim-closetag'
  let g:closetag_close_shortcut = ''
  let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*jsx'

  " Preview colours in source code while editing
  Plug 'ap/vim-css-color'

  " A much simpler way to use some motions in vim
  Plug 'easymotion/vim-easymotion'
  let g:EasyMotion_smartcase = 1

  " CSS3 syntax (and syntax defined in some foreign specifications) support for Vim's built-in syntax/css.vim
  Plug 'hail2u/vim-css3-syntax'
  augroup VimCSS3Syntax
    autocmd!
    autocmd FileType css setlocal iskeyword+=-
  augroup END

  " Improved incremental searching for Vim
  Plug 'haya14busa/incsearch.vim'

  " Generate JSDoc to your JavaScript code
  Plug 'heavenshell/vim-jsdoc'

  " A command-line fuzzy finder
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }

  " fzf bindings for vim
  Plug 'junegunn/fzf.vim'
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

  " A Vim alignment plugin
  Plug 'junegunn/vim-easy-align'

  " Asynchronously control git repositories in Neovim/Vim 8
  Plug 'lambdalisue/gina.vim'

  " The fancy start screen for Vim.
  Plug 'mhinz/vim-startify'

  " Retro groove color scheme for Vim
  Plug 'morhetz/gruvbox'

  " React JSX syntax highlighting and indenting for vim
  Plug 'mxw/vim-jsx'
  let g:jsx_ext_required = 0
  let g:mta_filetypes = {
        \ 'html' : 1,
        \ 'javascript.jsx' : 1,
        \ 'jinja' : 1,
        \ 'liquid' : 1,
        \ 'markdown' : 1,
        \ 'xhtml' : 1,
        \ 'xml' : 1,
        \}

  " ES.Next syntax for Vim
  Plug 'othree/es.next.syntax.vim'

  " YAJS.vim: Yet Another JavaScript Syntax for Vim
  Plug 'othree/yajs.vim'

  " A tree explorer plugin for vim
  Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
  let NERDTreeAutoDeleteBuffer = 1
  let NERDTreeChDirMode = 2
  let NERDTreeMinimalUI = 1
  let NERDTreeQuitOnOpen = 1
  let NERDTreeShowHidden = 1

  " Quick Google lookup directly from Vim
  Plug 'szw/vim-g'

  " Comment stuff out
  Plug 'tpope/vim-commentary'

  " Quoting/parenthesizing made simple
  Plug 'tpope/vim-surround'

  " Lean & mean status/tabline for vim that's light as air
  Plug 'vim-airline/vim-airline'
  " let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#ale#enabled = 1
  let g:airline#extensions#tabline#fnamemod = ':t'
  let g:airline#extensions#tabline#show_close_button= 0
  let g:airline#extensions#whitespace#enabled = 0
  let g:airline_section_x = ''
  let g:airline_section_y = ''
  let g:airline_section_z = ''
  let g:airline_theme='gruvbox'

  " Asynchronous Lint Engine
  Plug 'w0rp/ale'
  let g:ale_linters = {
        \   'javascript': ['eslint'],
        \   'javascript.jsx': ['eslint'],
        \}

  " Make the yanked region apparent!
  Plug 'machakann/vim-highlightedyank'
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
map <F3> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>
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
nnoremap <silent> <leader>gd :Gina diff<CR>
nnoremap <silent> <leader>gp :Gina push<CR>
nnoremap <silent> <leader>gs :Gina status<CR>
nnoremap <silent> <leader>t :term<CR>
nnoremap H ^
nnoremap L g_
nnoremap S i<cr><esc><right>
tnoremap <Esc> <C-\><C-n>
vmap <leader>s :sort<CR>
xmap ga <Plug>(EasyAlign)


"""""""""""""
" 
" AUTOCOMMANDS
"
"""""""""""""
au TermOpen * setlocal nonumber norelativenumber
