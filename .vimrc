" PLUGIN SETUP {{{
if empty(glob('~/.vim/autoload/plug.vim'))
	silent execute "!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
	autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
  " Provides insert mode auto-completion for quotes, parens, brackets, etc
  Plug 'Raimondi/delimitMate'

  " Always highlights the enclosing html/xml tags
  Plug 'Valloric/MatchTagAlways'
  let g:mta_filetypes = {
        \ 'html' : 1,
        \ 'javascript.jsx' : 1,
        \ 'jinja' : 1,
        \ 'liquid' : 1,
        \ 'markdown' : 1,
        \ 'xhtml' : 1,
        \ 'xml' : 1,
        \}

  " A code-completion engine
  " Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
  " let g:ycm_autoclose_preview_window_after_insertion = 1

  " Shows a git diff in the gutter (sign column) and stages/undoes hunks
  Plug 'airblade/vim-gitgutter'

  " Auto close (X)HTML tags
  Plug 'alvan/vim-closetag'
  let g:closetag_close_shortcut = ''
  let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*jsx'

  " CSS3 syntax (and syntax defined in some foreign specifications) support for Vim's built-in syntax/css.vim
  Plug 'hail2u/vim-css3-syntax'
  augroup VimCSS3Syntax
    autocmd!
    autocmd FileType css setlocal iskeyword+=-
  augroup END

  " Improved incremental searching for Vim
  Plug 'haya14busa/incsearch.vim'

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
  let g:startify_lists = [
        \ { 'type': 'files', 'header': ['   MRU:'] },
        \ ]

	" Vastly improved Javascript indentation and syntax support in Vim
	Plug 'pangloss/vim-javascript'

  " React JSX syntax highlighting and indenting for vim
  Plug 'mxw/vim-jsx'

  " A tree explorer plugin for vim
  Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
  let NERDTreeAutoDeleteBuffer = 1
  let NERDTreeChDirMode = 2
  let NERDTreeMinimalUI = 1
  let NERDTreeQuitOnOpen = 1
  let NERDTreeShowHidden = 1
	let NERDTreeStatusline = ''

  " Comment stuff out
  Plug 'tpope/vim-commentary'

  " The set of operator and textobject plugins to search/select/edit sandwiched textobjects.
  Plug 'machakann/vim-sandwich'

  " Lean & mean status/tabline for vim that's light as air
  Plug 'vim-airline/vim-airline'
	let g:airline#extensions#branch#enabled = 1
  let g:airline#extensions#ale#enabled = 1
  let g:airline#extensions#tabline#enabled = 0
  let g:airline#extensions#tabline#show_close_button = 0
  let g:airline#extensions#whitespace#enabled = 0
  let g:airline_inactive_collapse=0
  let g:airline_section_a = ''
  let g:airline_section_b = ''
  let g:airline_section_c = '%t'
  let g:airline_section_x = ''
  let g:airline_section_y = ''
  let g:airline_section_z = '%l'
  let g:airline_theme='tender'

  " Asynchronous Lint Engine
  Plug 'w0rp/ale'
  let g:ale_linters = {
        \   'javascript': ['eslint'],
        \   'javascript.jsx': ['eslint'],
        \}
	let g:ale_fix_on_save = 1
  let g:ale_fixers = {}
  let g:ale_fixers.javascript = ['eslint']

  " Make the yanked region apparent!
  Plug 'machakann/vim-highlightedyank'
	let g:highlightedyank_highlight_duration = 500

	" Async Vim plugin for showing your outdated Vim plugins
  Plug 'semanser/vim-outdated-plugins'

	" a Git wrapper so awesome, it should be illegal 
	Plug 'tpope/vim-fugitive'

	" Vim plugin: Create your own text objects
	Plug 'kana/vim-textobj-user'

  " A text object for any of '', "", (), {}, [] and <>.
	Plug 'rhysd/vim-textobj-anyblock'

  " A 24bit colorscheme for Vim, Airline and Lightline
	Plug 'jacoborus/tender.vim'

	" Vim plugin for selectively illuminating other uses of current word under the cursor
	Plug 'RRethy/vim-illuminate'
	let g:Illuminate_ftblacklist = ['nerdtree']

  " Complete engine and Language Server support for neovim & vim, featured as VSCode
  Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

	" Sane buffer/window deletion.
	Plug 'mhinz/vim-sayonara'

	" Git branch management for Vim
  Plug 'sodapopcan/vim-twiggy'

  " Changes Vim working directory to project root (identified by presence of known directory or file).
  Plug 'airblade/vim-rooter'

  " Seamless navigation between tmux panes and vim splits
  Plug 'christoomey/vim-tmux-navigator'
call plug#end()
" }}}

" GENERAL {{{
syntax enable                          " Enable syntax highlighting
colorscheme tender
let mapleader = "\<Space>"             " Setup leader key
let macvim_skip_colorscheme=1
let g:startify_custom_header = split(system("figlet `date \"+%H : %M : %S\"`"), "\n") + startify#fortune#boxed()
" }}}

" VARS {{{
if has('nvim')
  set inccommand=nosplit      " shows the effects of a command incrementally, as you type.
endif

set autoread                " autoload file changes
set autowriteall            " autosave files
set background=dark         " dark colorscheme
set completeopt-=preview    " Do not show preview window for ins-completion.
set diffopt+=vertical       " split diffopt in vertical mode
set encoding=utf-8          " set the character encoding to UTF-8
set expandtab               " convert tabs to the spaces
set foldlevel=2             " sets the fold level
set foldmethod=indent       " type of indentation
set foldnestmax=10          " sets the maximum nesting of folds
set gcr=a:blinkon0          " disable cursor blinking
set guioptions=             " remove all GUI components and options.
set hidden                  " hide when switching buffers instead of unloading
set history=1000            " store lots of :cmdline history
set hlsearch                " highlights the string matched by the search
set ignorecase              " make searching case insensitive
set incsearch               " incremental search
set nobackup                " disable backups
set nocompatible            " use Vim settings, rather then Vi
set nofoldenable            " when off, all folds are open when open a new file
set noshowmode              " don't show mode as we use a status line plugin
set noswapfile              " disable swapfile
set nowrap                  " wrap lines
set scrolloff=10            " keep cursor at the minimum 10 rows from the screen borders
set shiftwidth=2            " 2 spaces
set showmatch               " show match brackets
set sidescroll=1            " incrementally scroll one character
set signcolumn=yes          " always show signcolumns
set smartcase               " unless the query has capital letters
set splitbelow              " open new split below
set splitright              " open new split right
set tabstop=2               " 2 spaces
set termguicolors           " enable True color
set ttyfast                 " always assume a fast terminal
set undodir=~/.vim/undo-dir " setup undo directory
set undofile                " save undo chages even after computer restart
set updatetime=250          " reduce update time in Vim
set wildmenu                " visual autocomplete for command menu
" " }}}

" KEYMAP {{{
inoremap <C-c> <CR><Esc>O
inoremap <C-j> <Down>
inoremap <C-k> <Up>
map / <Plug>(incsearch-forward)
map <silent> <C-h> :call WinMove('h')<cr>
map <silent> <C-j> :call WinMove('j')<cr>
map <silent> <C-k> :call WinMove('k')<cr>
map <silent> <C-l> :call WinMove('l')<cr>
nmap caa cab
nmap cii cib
nmap daa dab
nmap dii dib
nnoremap <C-S-P> :call <SID>SynStack()<CR>
nnoremap <esc> :noh<return><esc>
nnoremap <leader>ev :vsplit ~/dotfiles/.vimrc<cr>
nnoremap <silent> <S-W> :Sayonara<CR>
nnoremap <silent> <D-S-*> :Ag <C-R><C-W><CR>
nnoremap <silent> <leader><tab> :Files<CR>
nnoremap <silent> <leader>ga :Gina add .<CR>
nnoremap <silent> <leader>gc :Gina commit<CR>
nnoremap <silent> <leader>gd :Gina diff<CR>
nnoremap <silent> <leader>gp :Gina push<CR>
nnoremap <silent> <leader>gs :Gina status -s<CR>
nnoremap <silent> <leader>gt :Twiggy<CR>
nnoremap <silent> <leader>j :ALENext<cr>
nnoremap <silent> <leader>k :ALEPrevious<cr>
nnoremap <silent> <leader>pu :PlugUpdate<CR>
nnoremap <silent> <leader>r :source %<CR>
nnoremap <silent> <leader>t :term<CR>
nnoremap H 0
nnoremap L $
nnoremap P P`[v`]=
nnoremap S i<cr><esc><right>
nnoremap p p`[v`]=
nnoremap ¬ :bnext<CR>
nnoremap ˙ :bprevious<CR>
noremap <F3> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>
noremap <silent> <D-1> :tabn 1<cr>
noremap <silent> <D-2> :tabn 2<cr>
noremap <silent> <D-3> :tabn 3<cr>
noremap <silent> <D-4> :tabn 4<cr>
noremap <silent> <D-5> :tabn 5<cr>
noremap <silent> <D-6> :tabn 6<cr>
noremap <silent> <D-7> :tabn 7<cr>
noremap <silent> <D-8> :tabn 8<cr>
noremap <silent> <D-9> :tabn 9<cr>
noremap <silent> <tab> :NERDTreeToggle<CR>
noremap ?  <Plug>(incsearch-backward)
noremap g/ <Plug>(incsearch-stay)
tnoremap <Esc> <C-\><C-n>
vnoremap <leader>s :sort<CR>
xmap ga <Plug>(EasyAlign)

" COC keymap
" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" Use <cr> for confirm completion.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" }}}

" AUTOCOMMANDS {{{
if has('nvim')
  augroup term
    autocmd!
    autocmd TermOpen * setlocal nonumber norelativenumber
  augroup END
endif

augroup folding
  autocmd FileType vim setlocal foldmethod=marker
  autocmd FileType vim execute "normal! zM"
augroup END

au BufRead,BufNewFile .eslintrc set filetype=json

autocmd CursorHoldI,CursorMovedI * silent! call CocAction('showSignatureHelp')

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
" }}}

" FUNCTIONS {{{
" correct label for folding block in vimrc
set foldtext=MyFoldText()
function! MyFoldText()
	let line = getline(v:foldstart)
	let sub = substitute(line, '/\*\|\*/\|{{{\d\=', '', 'g')
	return v:folddashes . sub
endfunction

function! WinMove(key)
	let t:curwin = winnr()
	exec "wincmd ".a:key
	if (t:curwin == winnr())
		if (match(a:key,'[jk]'))
			wincmd v
		else
			wincmd s
		endif
		exec "wincmd ".a:key
	endif
endfunction

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" }}}

" HIGHLIGHT {{{
hi illuminatedWord guibg=#4c525e
" }}}
