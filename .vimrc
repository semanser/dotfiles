" PLUGIN SETUP {{{
if empty(glob('~/.vim/autoload/plug.vim'))
  silent execute "!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
  " One Dark Theme for Neovim >= 0.5.0 written in lua
  Plug 'navarasu/onedark.nvim'

  " Find, Filter, Preview, Pick. All lua, all the time.
  Plug 'nvim-lua/popup.nvim'

  " plenary: full; complete; entire; absolute; unqualified. All the lua functions I don't want to write twice.
  Plug 'nvim-lua/plenary.nvim'

  " Find, Filter, Preview, Pick. All lua, all the time.
  Plug 'nvim-telescope/telescope.nvim'

  " Nvim Treesitter configurations and abstraction layer
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

  " Quickstart configurations for the Nvim LSP client
  Plug 'neovim/nvim-lspconfig'

  " Auto completion plugin for nvim that written in Lua.
  Plug 'hrsh7th/nvim-compe'
  let g:compe = {}
  let g:compe.enabled = v:true
  let g:compe.autocomplete = v:true
  let g:compe.debug = v:false
  let g:compe.min_length = 2
  let g:compe.preselect = 'enable'
  let g:compe.throttle_time = 80
  let g:compe.source_timeout = 200
  let g:compe.resolve_timeout = 800
  let g:compe.incomplete_delay = 400
  let g:compe.max_abbr_width = 200
  let g:compe.max_kind_width = 200
  let g:compe.max_menu_width = 200
  let g:compe.documentation = v:true

  let g:compe.source = {}
  let g:compe.source.path = v:true
  let g:compe.source.buffer = v:true
  let g:compe.source.calc = v:true
  let g:compe.source.nvim_lsp = v:true
  let g:compe.source.nvim_lua = v:true

  " Provides insert mode auto-completion for quotes, parens, brackets, etc
  Plug 'Raimondi/delimitMate'

  " Vim plugin that allows use of vifm as a file picker
  Plug 'vifm/vifm.vim'

  " Git signs written in pure lua
  Plug 'lewis6991/gitsigns.nvim'

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
  let g:fzf_preview_window = ''

  " fzf bindings for vim
  Plug 'junegunn/fzf.vim'
  let $FZF_DEFAULT_COMMAND = 'ag -g ""'
  let $FZF_DEFAULT_OPTS='-m --reverse'
  let g:fzf_layout = { 'window': { 'width': 0.6, 'height': 0.6 } }
  let g:fzf_colors = { 'fg+':     ['fg', 'Exception', 'CursorColumn', 'Normal'] }

  " A Vim alignment plugin
  Plug 'junegunn/vim-easy-align'

  " A Git wrapper so awesome, it should be illegal
  Plug 'tpope/vim-fugitive'

  " rhubarb.vim: GitHub extension for fugitive.vim
  Plug 'tpope/vim-rhubarb'

	" Vastly improved Javascript indentation and syntax support in Vim
  Plug 'pangloss/vim-javascript'

  " React JSX syntax highlighting and indenting for vim
  Plug 'mxw/vim-jsx'

  " Comment stuff out
  Plug 'tpope/vim-commentary'

  " The set of operator and textobject plugins to search/select/edit sandwiched textobjects.
  Plug 'machakann/vim-sandwich'

  " A blazing fast and easy to configure neovim statusline plugin written in pure lua.
  Plug 'hoob3rt/lualine.nvim'

  " Asynchronous Lint Engine
  Plug 'w0rp/ale'
  let g:ale_linters = {
        \   'javascript': ['eslint'],
        \   'javascript.jsx': ['eslint'],
        \   'rust': ['rls'],
        \}
	let g:ale_fix_on_save = 1
  let g:ale_fixers = {}
  let g:ale_fixers.javascript = ['eslint']
  let g:ale_fixers.rust = ['rustfmt']
  let g:ale_rust_rls_toolchain = 'stable'

  " Make the yanked region apparent!
  Plug 'machakann/vim-highlightedyank'
  let g:highlightedyank_highlight_duration = 300

	" Async Vim plugin for showing your outdated Vim plugins
  Plug 'semanser/vim-outdated-plugins'

  " Vim plugin for selectively illuminating other uses of current word under the cursor
  Plug 'RRethy/vim-illuminate'

  " Seamless navigation between tmux panes and vim splits
  Plug 'christoomey/vim-tmux-navigator'

  " Override vim syntax for yaml files
  Plug 'stephpy/vim-yaml'

  " A Vim plugin for profiling Vim's startup time.
  Plug 'dstein64/vim-startuptime'

  " Vim plugin for improved search highlighting
  Plug 'timakro/vim-searchant'

  " Vim configuration files for Elixir
  Plug 'elixir-editors/vim-elixir'

  " Displays current match and total matches information
  Plug 'osyo-manga/vim-anzu'
call plug#end()
" }}}

" LUA {{{

lua << EOF
  require'lspconfig'.tsserver.setup{}
  require('gitsigns').setup()
EOF

lua << EOF
require('lualine').setup({
  options = {
    icons_enabled = false,
    theme = 'onedark',
    component_separators = {'', ''},
    section_separators = {'', ''},
  },
  sections = {
    lualine_a = {''},
    lualine_b = {''},
    lualine_c = {'filename'},
    lualine_x = {''},
    lualine_y = {'location'},
    lualine_z = {{'diagnostics', sources = {'nvim_lsp'}}}
  },
})
EOF
" }}}

" GENERAL {{{
syntax enable              " Enable syntax highlighting
language en_US
colorscheme onedark
let g:onedark_style = 'deep'
let mapleader = "\<Space>" " Setup leader key
" }}}

" VARS {{{
set autoread                " autoload file changes
set autowriteall            " autosave files
set background=dark         " dark colorscheme
set completeopt=menuone,noselect
set cursorline              " set cursor line
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
set inccommand=nosplit      " shows the effects of a command incrementally, as you type.
set incsearch               " incremental search
set nobackup                " disable backups
set nocompatible            " use Vim settings, rather then Vi
set nofoldenable            " when off, all folds are open when open a new file
set nonumber
set norelativenumber
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
" }}}

" KEYMAP {{{
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm({ 'keys': "\<Plug>delimitMateCR", 'mode': '' })
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
map / <Plug>(incsearch-forward)
nnoremap <C-S-P> :call <SID>SynStack()<CR>
nnoremap <esc> :noh<return><esc>
nnoremap <leader>a :Ag 
nnoremap <leader>ev :tabnew ~/dotfiles/.vimrc<cr>
nnoremap <silent> <leader><tab> :Files<CR>
nnoremap <silent> <leader>gs :Git<CR>
nnoremap <silent> <leader>gc :GCheckout<CR>
nnoremap <silent> <leader>gd :Git diff<CR>
nnoremap <silent> <leader>j :ALENext<cr>
nnoremap <silent> <leader>k :ALEPrevious<cr>
nnoremap <silent> <leader>pu :PlugUpdate<CR>
nnoremap <silent> <leader>r :source %<CR>
nnoremap <silent> <leader>u :Ag <C-R><C-W><CR>
vnoremap <silent> <leader>i :call <SID>find_selection()<CR>
vnoremap <leader>y "+y
nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>
nnoremap Q <nop>
nnoremap H 0
nnoremap L $
nnoremap P P`[v`]=
nnoremap S i<cr><esc><right>
nnoremap p p`[v`]=
noremap <F3> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>
noremap <silent> <leader>w :EditVifm<CR>
noremap ? <Plug>(incsearch-backward)
noremap g/ <Plug>(incsearch-stay)
vnoremap <leader>s :sort<CR>
xmap ga <Plug>(EasyAlign)

augroup folding
  autocmd FileType vim setlocal foldmethod=marker
  autocmd FileType vim execute "normal! zM"
augroup END

au BufRead,BufNewFile .eslintrc set filetype=json

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noruler
  \| autocmd BufLeave <buffer> set laststatus=2 ruler

" Disable Searchant highlight when incsearch.vim highlights also disable
autocmd CursorMoved * call SearchantStop()
function! SearchantStop()
  :execute "normal \<Plug>SearchantStop"
endfunction
" }}}

" FUNCTIONS {{{
function! s:find_selection()
  let selection = s:get_visual_selection()
  execute 'Ag '.s:get_visual_selection()
endfunction

function! s:get_visual_selection()
  " why is this not a built-in vim script function?!
  let [line_start, column_start] = getpos("'<")[1:2]
  let [line_end, column_end] = getpos("'>")[1:2]
  let lines = getline(line_start, line_end)
  if len(lines) == 0
    return ''
  endif
  let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][column_start - 1:]
  return join(lines, "\n")
endfunction
" }}}

" HIGHLIGHT {{{
hi illuminatedWord guibg=#4c525e
hi Visual guifg=#000000 guibg=#FFFFFF gui=none
hi Search guibg=Blue guifg=White
hi MatchParen guibg=#db8446
" }}}
