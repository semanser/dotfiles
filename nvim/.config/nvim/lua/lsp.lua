-- Setup lspconfig.

-- This should be removed after this issue is fixed
-- https://github.com/neovim/neovim/issues/28058#issuecomment-2146978107
local make_client_capabilities = vim.lsp.protocol.make_client_capabilities
function vim.lsp.protocol.make_client_capabilities()
	local caps = make_client_capabilities()
	if not (caps.workspace or {}).didChangeWatchedFiles then
		vim.notify("lsp capability didChangeWatchedFiles is already disabled", vim.log.levels.WARN)
	else
		caps.workspace.didChangeWatchedFiles = nil
	end

	return caps
end

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

capabilities.textDocument.completion.completionItem.snippetSupport = false

local eslint = {
	lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
	lintStdin = true,
	lintFormats = { "%f:%l:%c: %m" },
	lintIgnoreExitCode = true,
	formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
	formatStdin = true,
}

local function set_lsp_config(client)
	if client.server_capabilities.document_formatting then
		vim.cmd([[autocmd! BufWritePre <buffer> lua vim.lsp.buf.format()]])
	end
end

local function eslint_config_exists()
	local eslintrc = vim.fn.glob(".eslintrc*", 0, 1)
	local packagejson = vim.fn.glob("package.json", 0, 1)

	if not vim.tbl_isempty(eslintrc) then
		return true
	end

	if not vim.tbl_isempty(packagejson) then
		if vim.fn.filereadable("package.json") then
			if vim.fn.json_decode(vim.fn.readfile("package.json"))["eslintConfig"] then
				return true
			end
		end
	end

	return false
end

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<space>f", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end,
})

require("lspconfig").ts_ls.setup({
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		if client.config.flags then
			client.config.flags.allow_incremental_sync = true
		end
		client.server_capabilities.document_formatting = false
		set_lsp_config(client)
	end,
	root_dir = require("lspconfig/util").root_pattern("package.json"),
	single_file_support = false,
	flags = {
		debounce_text_changes = 150,
	},
})

require("lspconfig").elixirls.setup({
  cmd = { "elixir-ls" },
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    client.server_capabilities.document_formatting = true
    set_lsp_config(client)
  end,
})

require("lspconfig").denols.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	root_dir = require("lspconfig/util").root_pattern("deno.json", "deno.jsonc"),
})

require("lspconfig").rust_analyzer.setup({
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		if client.config.flags then
			client.config.flags.allow_incremental_sync = true
		end
		client.server_capabilities.document_formatting = false
		set_lsp_config(client)
	end,
	flags = {
		debounce_text_changes = 150,
	},
})

require("lspconfig").terraformls.setup({
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		if client.config.flags then
			client.config.flags.allow_incremental_sync = true
		end
		client.server_capabilities.document_formatting = true
		set_lsp_config(client)
	end,
	flags = {
		debounce_text_changes = 150,
	},
})

require("lspconfig").efm.setup({
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		client.server_capabilities.document_formatting = false
		client.server_capabilities.goto_definition = false
		set_lsp_config(client)
	end,
	root_dir = function()
		if not eslint_config_exists() then
			return nil
		end
		return vim.fn.getcwd()
	end,
	settings = {
		languages = {
			javascript = { eslint },
			javascriptreact = { eslint },
			["javascript.jsx"] = { eslint },
		},
	},
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
	},
	flags = {
		debounce_text_changes = 150,
	},
})

-- require("lspconfig").sumneko_lua.setup({
-- 	settings = {
-- 		Lua = {
-- 			runtime = {
-- 				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
-- 				version = "LuaJIT",
-- 			},
-- 			diagnostics = {
-- 				-- Get the language server to recognize the `vim` global
-- 				globals = { "vim" },
-- 			},
-- 			workspace = {
-- 				-- Make the server aware of Neovim runtime files
-- 				library = vim.api.nvim_get_runtime_file("", true),
-- 			},
-- 			-- Do not send telemetry data containing a randomized but unique identifier
-- 			telemetry = {
-- 				enable = false,
-- 			},
-- 		},
-- 	},
-- })

require("lspconfig").gopls.setup({
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		client.server_capabilities.document_formatting = true
		set_lsp_config(client)
	end,
	cmd = { "gopls", "serve" },
	filetypes = { "go", "gomod" },
	root_dir = require("lspconfig/util").root_pattern("go.work", "go.mod", ".git"),
	settings = {
		gopls = {
			analyses = {
				-- Can be removed after the 0.16 gopls release
				-- https://github.com/golang/go/issues/66876#issuecomment-2067327195
				loopclosure = false,
				unusedparams = true,
			},
			staticcheck = true,
			-- env = {
			-- 	GOOS = "js",
			-- 	GOARCH = "wasm",
			-- },
		},
	},
})
