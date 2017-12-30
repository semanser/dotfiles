call plug#begin('~/.vim/plugged')
  Plug 'Raimondi/delimitMate'
  Plug 'Valloric/MatchTagAlways'
  Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
  Plug 'airblade/vim-gitgutter'
  Plug 'alvan/vim-closetag'
  Plug 'ap/vim-css-color'
  Plug 'easymotion/vim-easymotion'
  Plug 'hail2u/vim-css3-syntax'
  Plug 'haya14busa/incsearch.vim'
  Plug 'joshdick/onedark.vim'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/vim-easy-align'
  Plug 'lambdalisue/gina.vim'
  Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
  Plug 'szw/vim-g'
  Plug 'tpope/vim-surround'
  Plug 'vim-airline/vim-airline'
  Plug 'w0rp/ale'
  Plug 'yuttie/comfortable-motion.vim'
" Plug 'mhinz/vim-signify'
call plug#end()


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

syntax on
colorscheme onedark
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
" w0rp/ale
"
"""""""""""""
let g:ale_linters = {
\   'javascript': ['eslint'],
\}



""""""""""""
"
" vim-closetag
"
""""""""""""
let g:closetag_close_shortcut = ''
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*jsx'



"""""""""""""""""
"
" junegunn/fzf
"
"""""""""""""""""
nnoremap <silent> <leader><tab> :Files<CR>
imap <C-c> <CR><Esc>O
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
let g:airline_theme='onedark'
" let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_close_button= 0
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#whitespace#enabled = 0



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
" YouCompleteMe
"
""""""""""""""
let g:ycm_autoclose_preview_window_after_insertion = 1



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
set guioptions+=e
set encoding=utf-8      " set the character encoding to UTF-8
set completeopt-=preview " Do not show preview window for ins-completion.



"""""""""""
"
" COLORS
"
"""""""""""
" hi CursorLine cterm=NONE   ctermbg=NONE   ctermfg=NONE  guibg=#0e0e16 guifg=NONE
" hi Cursor guibg=#E2E93C
hi Pmenu      ctermfg=NONE ctermbg=241    cterm=NONE    guifg=NONE    guibg=#181826 gui=NONE
hi PmenuSel   ctermfg=36   ctermbg=105    cterm=NONE    guifg=#101011 guibg=#E2E93C gui=NONE
hi EndOfBuffer guifg=bg
" call one#highlight('Normal', '', '13131c', '')

au InsertLeave * hi Cursor guibg=#E2E93C
au InsertEnter * hi Cursor guibg=#FF434E

" highlight line under cursor
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

au TermOpen * setlocal nonumber norelativenumber

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
tnoremap <Esc> <C-\><C-n>

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

