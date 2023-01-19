vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function()
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- autopairs for neovim written by lua
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	-- A comment toggler for Neovim, written in Lua
	use({
		"terrortylor/nvim-comment",
		config = function()
			require("nvim_comment").setup()
		end,
	})

	-- Git signs written in pure lua
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	})

	use({
		"folke/trouble.nvim",
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

	use({
		"is0n/fm-nvim",
		opt = true,
		cmd = "Broot",
		config = function()
			require("fm-nvim").setup({
				ui = {
					float = {
						border = "single",
					},
				},
				broot_conf = "~/.config/broot/conf.hjson",
			})
		end,
	})

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

	-- A clean, dark Neovim theme written in Lua, with support for lsp, treesitter and lots of plugins. Includes additional themes for Kitty, Alacritty, iTerm and Fish.
	use({
		"folke/tokyonight.nvim",
		config = function()
			require("tokyonight").setup({
				style = "night",
				transparent = true,
			})
			vim.cmd([[colorscheme tokyonight]])
		end,
	})

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
					theme = "tokyonight",
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

	-- Displays current match and total matches information
	use("osyo-manga/vim-anzu")

	-- Improved fzf.vim written in lua
	use({
		"ibhagwan/fzf-lua",
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

	use({
		"ggandor/leap.nvim",
		config = function()
			require("leap").add_default_mappings()
		end,
	})

  use("github/copilot.vim")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
