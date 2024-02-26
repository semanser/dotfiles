-- Enable syntax highlighting
vim.opt.syntax = "enable"

-- Set language to en_US
vim.opt.langmenu = "en_US"

-- Setup leader key
vim.g.mapleader = " "

-- Key mappings
vim.api.nvim_set_keymap("n", "<esc>", ":noh<CR><esc>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>a", ":FzfLua live_grep_native<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader><tab>", ":FzfLua files<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>gs", ":LazyGit<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>gd", ":tab Git diff<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>r", ":source %<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<Leader>y", '"+y', { noremap = true })
-- vim.api.nvim_set_keymap("x", "J", ":m '>+1<CR>gv=gv', { noremap = true })
-- vim.api.nvim_set_keymap("x", "K", ":m '<-2<CR>gv=gv', { noremap = true })
vim.api.nvim_set_keymap("n", "<Up>", ":resize +2<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Down>", ":resize -2<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Left>", ":vertical resize +2<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Right>", ":vertical resize -2<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "Q", "<nop>", { noremap = true })
vim.api.nvim_set_keymap("n", "H", "0", { noremap = true })
vim.api.nvim_set_keymap("n", "L", "$", { noremap = true })
vim.api.nvim_set_keymap("n", "P", "P`[v`]=", { noremap = true })
vim.api.nvim_set_keymap("n", "n", "nzzzv", { noremap = true })
vim.api.nvim_set_keymap("n", "N", "Nzzzv", { noremap = true })
vim.api.nvim_set_keymap("n", "p", "p`[v`]=", { noremap = true })
vim.api.nvim_set_keymap(
	"n",
	"<F3>",
	[[:lua vim.fn.execute('echo "hi<" .. synIDattr(synID(line("."),col("."),1),"name") .. "> trans<" .. synIDattr(synID(line("."),col("."),0),"name") .. "> lo<" .. synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") .. "> FG:" .. synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")')<CR>]],
	{ noremap = true }
)
vim.api.nvim_set_keymap("n", "<Leader>w", ":NvimTreeFindFileToggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<Leader>s", ":sort<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>xx", "<cmd>TroubleToggle<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>xq", "<cmd>TroubleToggle quickfix<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>xl", "<cmd>TroubleToggle loclist<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", { noremap = true })

-- Load other configuration files
require("options")

-- create augroup for mdx files to treat them as md
vim.cmd([[
augroup mdx
  autocmd!
  autocmd BufNewFile,BufRead *.mdx set filetype=markdown
augroup END
]])

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

require("lsp")
