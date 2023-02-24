-- Setup lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

local eslint = {
	lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
	lintStdin = true,
	lintFormats = { "%f:%l:%c: %m" },
	lintIgnoreExitCode = true,
	formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
	formatStdin = true,
}

local function set_lsp_config(client)
	if client.resolved_capabilities.document_formatting then
		vim.cmd([[autocmd! BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 300)]])
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

-- Use an on_attach_keybindinds function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach_keybindinds = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	-- Enable completion triggered by <c-x><c-o>
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	local opts = { noremap = true, silent = true }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	-- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	-- buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	buf_set_keymap("n", "ge", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
	buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
	buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
	buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
	buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

require("lspconfig").elixirls.setup({
	capabilities = capabilities,
	cmd = { "/usr/local/opt/elixir-ls/libexec/language_server.sh" },
})

require("lspconfig").tsserver.setup({
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		if client.config.flags then
			client.config.flags.allow_incremental_sync = true
		end
		client.resolved_capabilities.document_formatting = false
		on_attach_keybindinds(client, bufnr)
		set_lsp_config(client)
	end,
	flags = {
		debounce_text_changes = 150,
	},
})

require("lspconfig").rust_analyzer.setup({
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		if client.config.flags then
			client.config.flags.allow_incremental_sync = true
		end
		client.resolved_capabilities.document_formatting = false
		on_attach_keybindinds(client, bufnr)
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
		client.resolved_capabilities.document_formatting = true
		on_attach_keybindinds(client, bufnr)
		set_lsp_config(client)
	end,
	flags = {
		debounce_text_changes = 150,
	},
})

require("lspconfig").efm.setup({
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.goto_definition = false
		on_attach_keybindinds(client, bufnr)
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

require("lspconfig").gopls.setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
      client.resolved_capabilities.document_formatting = true
      on_attach_keybindinds(client, bufnr)
      set_lsp_config(client)
    end,
    cmd = {"gopls", "serve"},
    filetypes = {"go", "gomod"},
    root_dir = require("lspconfig/util").root_pattern("go.work", "go.mod", ".git"),
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
      },
    },
  }
