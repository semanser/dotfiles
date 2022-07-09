vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function()
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Next-generation motion plugin with incremental input processing, allowing for unparalleled speed with near-zero cognitive effort.
	use("ggandor/lightspeed.nvim")

	-- autopairs for neovim written by lua
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	-- A comment toggler for Neovim, written in Lua
	use("terrortylor/nvim-comment")

	-- Git signs written in pure lua
	use("lewis6991/gitsigns.nvim")

	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({
				auto_close = true,
				padding = false,
				fold_open = "↓",
				fold_closed = "→",
				icons = false,
				use_diagnostic_signs = true,
			})
		end,
	})

	-- Vim plugin that allows use of vifm as a file picker
	use("vifm/vifm.vim")

	-- Use treesitter to auto close and auto rename html tag
	use("windwp/nvim-ts-autotag")

	-- Improved incremental searching for Vim
	use("haya14busa/incsearch.vim")

	-- Snippet Engine for Neovim written in Lua.
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")

	-- A completion plugin for neovim coded in Lua.
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use({
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				}, {
					{ name = "buffer" },
				}),
			})
		end,
	})

	-- One Dark Theme for Neovim >= 0.5.0 written in lua
	use({
		"navarasu/onedark.nvim",
		config = function()
			require("onedark").setup({
				style = "deep",
			})
			require("onedark").load()
		end,
	})

	-- Find, Filter, Preview, Pick. All lua, all the time.
	use("nvim-lua/popup.nvim")

	-- full; complete; entire; absolute; unqualified. All the lua functions I don't want to write twice.
	use("nvim-lua/plenary.nvim")

	-- Nvim Treesitter configurations and abstraction layer
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
				ignore_install = {}, -- List of parsers to ignore installing
				highlight = {
					enable = true, -- false will disable the whole extension
					disable = {}, -- list of language that will be disabled
					-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
					-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
					-- Using this option may slow down your editor, and you may see some duplicate highlights.
					-- Instead of true it can also be a list of languages
					additional_vim_regex_highlighting = true,
				},
				indent = {
					enable = false,
				},
			})
		end,
	})

	-- Quickstart configurations for the Nvim LSP client
	use("neovim/nvim-lspconfig")

	-- A Git wrapper so awesome, it should be illegal
	use("tpope/vim-fugitive")

	-- rhubarb.vim: GitHub extension for fugitive.vim
	use("tpope/vim-rhubarb")

	-- React JSX syntax highlighting and indenting for vim
	use("MaxMEllon/vim-jsx-pretty")

	-- The set of operator and textobject plugins to search/select/edit sandwiched textobjects.
	use("machakann/vim-sandwich")

	-- A blazing fast and easy to configure neovim statusline plugin written in pure lua.
	use({
		"hoob3rt/lualine.nvim",
		config = function()
			require("lualine").setup({
				options = {
					icons_enabled = false,
					component_separators = { "", "" },
					section_separators = { "", "" },
					globalstatus = true,
				},
				sections = {
					lualine_a = { "" },
					lualine_b = { "" },
					lualine_c = {
						{
							"filename",
							path = 1,
						},
					},
					lualine_x = { "" },
					lualine_y = { "location" },
					lualine_z = { { "diagnostics", sources = { "nvim_diagnostic" } } },
				},
			})
		end,
	})

	-- Async Vim plugin for showing your outdated Vim plugins
	-- use 'semanser/vim-outdated-plugins'

	-- Vim plugin for selectively illuminating other uses of current word under the cursor
	use("RRethy/vim-illuminate")

	-- Seamless navigation between tmux panes and vim splits
	use("christoomey/vim-tmux-navigator")

	-- Vim plugin for improved search highlighting
	use("timakro/vim-searchant")

	-- Displays current match and total matches information
	use("osyo-manga/vim-anzu")

	-- Improved fzf.vim written in lua
	use({
		"ibhagwan/fzf-lua",
		-- optional for icon support
		requires = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("fzf-lua").setup({
				winopts = {
					height = 0.95,
					width = 0.95,
					preview = {
						horizontal = "right:40%",
						scrollbar = "border",
					},
				},
			})
		end,
	})

	-- Make the yanked region apparent!
	use({
		"machakann/vim-highlightedyank",
		config = function()
			vim.g.highlightedyank_highlight_duration = 300
		end,
	})

	-- markdown preview plugin for (neo)vim
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && yarn install",
	})

	-- Syntax Highlighting for Sailfish Templates in Vim
	use({
		"rust-sailfish/sailfish",
		{ rtp = "syntax/vim" },
	})

	if packer_bootstrap then
		require("packer").sync()
	end
end)
