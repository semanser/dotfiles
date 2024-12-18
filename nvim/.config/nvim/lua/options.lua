vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.autoread = true -- autoload file changes
vim.opt.autowriteall = true -- autosave files
vim.opt.background = "dark" -- dark colorscheme
vim.opt.backup = false -- disable backups
vim.opt.ch = 0 -- hide command line
vim.opt.compatible = false -- use Vim settings, rather then Vi
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.cursorline = true -- set cursor line
vim.opt.diffopt = vim.opt.diffopt + "vertical" -- split diffopt in vertical mode
vim.opt.encoding = "utf-8" -- set the character encoding to UTF-8
vim.opt.expandtab = true -- convert tabs to the spaces
vim.opt.foldenable = false -- when off, all folds are open when open a new file
vim.opt.foldlevel = 2 -- sets the fold level
vim.opt.foldmethod = "indent" -- type of indentation
vim.opt.foldnestmax = 10 -- sets the maximum nesting of folds
vim.opt.gcr = "a:blinkon0" -- disable cursor blinking
vim.opt.history = 1000 -- store lots of :cmdline history
vim.opt.hlsearch = true -- highlights the string matched by the search
vim.opt.ignorecase = true -- make searching case insensitive
vim.opt.incsearch = true -- incremental search
vim.opt.number = false
vim.opt.relativenumber = false
vim.opt.scrolloff = 10 -- keep cursor at the minimum 10 rows from the screen borders
vim.opt.shiftwidth = 2 -- 2 spaces
vim.opt.showmatch = true -- show match brackets
vim.opt.showmode = false -- don't show mode as we use a status line plugin
vim.opt.sidescroll = 1 -- incrementally scroll one character
vim.opt.signcolumn = "yes" -- always show signcolumns
vim.opt.smartcase = true -- unless the query has capital letters
vim.opt.splitbelow = true -- open new split below
vim.opt.splitright = true -- open new split right
vim.opt.swapfile = false -- disable swapfile
vim.opt.tabstop = 2 -- 2 spaces
vim.opt.termguicolors = true -- enable True color
vim.opt.ttyfast = true -- always assume a fast terminal
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undo-dir" -- setup undo directory
vim.opt.undofile = true -- save undo chages even after computer restart
vim.opt.updatetime = 250 -- reduce update time in Vim
vim.opt.wildmenu = true -- visual autocomplete for command menu
vim.opt.wrap = false -- wrap lines
vim.opt.fillchars:append("eob: ")
