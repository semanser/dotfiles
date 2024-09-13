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
vim.api.nvim_set_keymap("n", "<Leader>gd", ":tab Git diffthis<CR>", { noremap = true, silent = true })
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
vim.api.nvim_set_keymap("n", "<Leader>w", ":NvimTreeFindFileToggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<Leader>s", ":sort<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>xx", "<cmd>TroubleToggle<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>xq", "<cmd>TroubleToggle quickfix<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>xl", "<cmd>TroubleToggle loclist<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>xr", "<cmd>TroubleToggle lsp_references<cr>", { noremap = true })

vim.keymap.set("n", "<F5>", function()
	require("dap").continue()
end)
vim.keymap.set("n", "<F10>", function()
	require("dap").step_over()
end)
vim.keymap.set("n", "<F11>", function()
	require("dap").step_into()
end)
vim.keymap.set("n", "<F12>", function()
	require("dap").step_out()
end)
vim.keymap.set("n", "<Leader>b", function()
	require("dap").toggle_breakpoint()
end)
vim.keymap.set("n", "<Leader>B", function()
	require("dap").set_breakpoint()
end)
vim.keymap.set("n", "<Leader>lp", function()
	require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end)
vim.keymap.set("n", "<Leader>dr", function()
	require("dap").repl.open()
end)
vim.keymap.set("n", "<Leader>dl", function()
	require("dap").run_last()
end)
vim.keymap.set({ "n", "v" }, "K", function()
	local dap = require("dap")
	if dap.session() then
		require("dap.ui.widgets").hover()
	else
		vim.lsp.buf.hover()
	end
end)
vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
	require("dap.ui.widgets").preview()
end)
vim.keymap.set("n", "<Leader>df", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.frames)
end)
vim.keymap.set("n", "<Leader>ds", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.scopes)
end)

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
