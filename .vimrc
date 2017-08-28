call plug#begin('~/.vim/plugged')
  Plug 'airblade/vim-gitgutter'
  Plug 'airblade/vim-gitgutter'
  Plug 'alvan/vim-closetag'
  Plug 'ap/vim-css-color'
  Plug 'bronson/vim-trailing-whitespace'
  Plug 'easymotion/vim-easymotion'
  Plug 'hail2u/vim-css3-syntax'
  Plug 'haya14busa/incsearch.vim'
  Plug 'junegunn/vim-easy-align'
  Plug 'lambdalisue/gina.vim'
  Plug 'mileszs/ack.vim'
  Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'raimondi/delimitMate'
  Plug 'rakr/vim-one'
  Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
  Plug 'tpope/vim-surround'
  Plug 'valloric/MatchTagAlways'
  Plug 'valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'wincent/command-t', { 'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make' }
  Plug 'yuttie/comfortable-motion.vim'
" Plug 'mhinz/vim-signify'
call plug#end()


syntax on
colorscheme one
let mapleader = "\<Space>"

" Setup working directory
cd /Users/semanser/Documents/Programming/

"""""""""""""
"
" NERDTree
"
"""""""""""""
map <Leader>n :NERDTreeToggle<CR>
let NERDTreeShowHidden=1



"""""""""""""
"
" CommmandT
"
"""""""""""""
let g:CommandTFileScanner = "git"
let g:CommandTHighlightColor = #fafafa


"""""""""""""
"
" ack
"
"""""""""""""
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif



""""""""""""
"
" vim-closetag
"
""""""""""""
let g:closetag_close_shortcut = ''
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*jsx'



"""""""""""""
"
" vim-jsx
"
""""""""""""
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



""""""""""""""""""
"
" vim-easymotion
"
""""""""""""""""""
nmap s <Plug>(easymotion-overwin-f2)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
let g:EasyMotion_smartcase = 1 " Turn on case insensitive feature



"""""""""""""""""""
"
" vim-javascript
"
""""""""""""""""""
let g:javascript_plugin_jsdoc = 1


"""""""""""""""
"
" delimitMate
"
"""""""""""""""
let delimitMate_expand_cr = 1 " autoindent on carriage return



"""""""""""""""
"
" incsearch
"
""""""""""""""
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)



"""""""""""
"
" airline
"
"""""""""""
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z = ''
let g:airline#extensions#tabline#fnamemod = ':t'



"""""""""""""
"
" vim-easy-align
"
"""""""""""""
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)



""""""""""""""
"
" VARS
"
""""""""""""""
set autoread            " autoload file changes
set autowriteall        " autosave files
set background=dark     " dark colorscheme One
set expandtab           " convert tabs to the spaces
set gcr=a:blinkon0      " disable cursor blinking
set hidden              " buffer becomes hidden when it is abandoned
set history=1000        " store lots of :cmdline history
set hlsearch            " highlights the string matched by the search
set ignorecase          " make searching case insensitive
set incsearch           " incremental search
set lazyredraw          " only redraw when necessary
set nobackup            " disable backups
set nocompatible        " use Vim settings, rather then Vi
set noshowmode          " don't show mode as we use a status line plugin
set noswapfile          " disable swapfile
set nowrap              " wrap lines
set number 		          " show line number
set relativenumber      " make relative line number
set scrolloff=9999      " keep cursor at the center of the screen
set shiftwidth=2        " 2 spaces
set showcmd             " show (partial) command in status line
set showmatch           " show matching brackets
set showmatch           " show match brackets
set sidescroll=1        " incrementally scroll one character
set smartcase           " ... unless the query has capital letters
set splitbelow          " open new split below
set splitright          " open new split right
set tabstop=2           " 2 spaces
set termguicolors       " enable True color
set ttyfast             " always assume a fast terminal
set wildmenu            " visual autocomplete for command menu
set guioptions=         " remove scroll bars
set foldmethod=indent   " type of indentation
set foldnestmax=10      " sets the maximum nesting of folds
set nofoldenable        " when off, all folds are open when open a new file
set foldlevel=2         " sets the fold level

"""""""""""
"
" COLORS
"
"""""""""""
hi CursorLine cterm=NONE   ctermbg=NONE   ctermfg=NONE  guibg=#1c1c1c guifg=NONE
hi MatchParen cterm=bold   ctermbg=green  ctermfg=blue
hi Pmenu      ctermfg=NONE ctermbg=241    cterm=NONE    guifg=NONE    guibg=#64697a gui=NONE
hi PmenuSel   ctermfg=36   ctermbg=105    cterm=NONE    guifg=#fafafa guibg=#95bc07 gui=NONE
hi EndOfBuffer guifg=bg
set guifont=Inconsolata:h18
call one#highlight('Normal', '', '1F2334', '')

" highlight line under cursor
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END



"""""""""""
"
" KEYMAP
"
"""""""""""
nmap ¬ :bnext<CR>
nmap ˙ :bprevious<CR>
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
nnoremap <esc> :noh<return><esc>

" ====== Make tabs be addressable via Apple+1 or 2 or 3, etc
" Use numbers to pick the tab you want (like iTerm)
map <silent> <D-1> :tabn 1<cr>
map <silent> <D-2> :tabn 2<cr>
map <silent> <D-3> :tabn 3<cr>
map <silent> <D-4> :tabn 4<cr>
map <silent> <D-5> :tabn 5<cr>
map <silent> <D-6> :tabn 6<cr>
map <silent> <D-7> :tabn 7<cr>
map <silent> <D-8> :tabn 8<cr>
map <silent> <D-9> :tabn 9<cr>
