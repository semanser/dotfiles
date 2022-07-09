vim.cmd([[
syntax enable              " Enable syntax highlighting
language en_US
let mapleader = "\<Space>" " Setup leader key

map / <Plug>(incsearch-forward)
" nnoremap <C-S-P> :call <SID>SynStack()<CR>
nnoremap <esc> :noh<return><esc>
nnoremap <leader>a :FzfLua live_grep_native<CR>
nnoremap <leader>ev :tabnew ~/dotfiles/.vimrc<cr>
nnoremap <silent> <leader><tab> :FzfLua files<CR>
nnoremap <silent> <leader>gs :Ge :<CR>
nnoremap <silent> <leader>gc :GCheckout<CR>
nnoremap <silent> <leader>gd :tab Git diff<CR>
nnoremap <silent> <leader>pu :PlugUpdate<CR>
nnoremap <silent> <leader>r :source %<CR>
nnoremap <silent> <leader>u :Rg <C-R><C-W><CR>
nnoremap <silent> <leader>h :TroubleToggle<CR>
" vnoremap <silent> <leader>i :call <SID>find_selection()<CR>
vnoremap <leader>y "+y
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>
nnoremap Q <nop>
nnoremap H 0
nnoremap L $
nnoremap P P`[v`]=
nnoremap n nzzzv
nnoremap N Nzzzv
" nnoremap S i<cr><esc><right>
nnoremap p p`[v`]=
noremap <F3> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>
noremap <silent> <leader>w :EditVifm<CR>
noremap ? <Plug>(incsearch-backward)
noremap g/ <Plug>(incsearch-stay)
vnoremap <leader>s :sort<CR>
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>

augroup folding
  autocmd FileType vim setlocal foldmethod=marker
  autocmd FileType vim execute "normal! zM"
augroup END

au BufRead,BufNewFile .eslintrc set filetype=json
au BufRead,BufNewFile *.js set filetype=javascript
au BufRead,BufNewFile *.jsx set filetype=javascript

" Disable Searchant highlight when incsearch.vim highlights also disable
autocmd CursorMoved * call SearchantStop()
function! SearchantStop()
  :execute "normal \<Plug>SearchantStop"
endfunction

function! s:find_selection()
  let selection = s:get_visual_selection()
  execute 'Rg '.s:get_visual_selection()
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

hi illuminatedWord guibg=#4c525e
hi Visual guifg=#000000 guibg=#FFFFFF gui=none
hi Search guibg=Blue guifg=White
hi MatchParen guibg=#db8446
]])

require("options")
require("plugins")
 require("lsp")
