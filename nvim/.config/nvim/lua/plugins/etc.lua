return {
	{
		"neovim/nvim-lspconfig",
		event = "VeryLazy",
	},
	{
		"RRethy/vim-illuminate",
		event = "VeryLazy",
		config = function()
			require("illuminate").configure({
				filetypes_denylist = {
					"dirbuf",
					"dirvish",
					"fugitive",
					"NvimTree",
				},
				under_cursor = false,
			})
		end,
	},
	"christoomey/vim-tmux-navigator",
	{
		"folke/trouble.nvim",
		event = "VeryLazy",
		opts = {
			auto_close = true,
		},
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		"ibhagwan/fzf-lua",
		event = "VeryLazy",
		opts = {
			fzf_colors = true,
			files = {
				color_icons = false,
			},
			winopts = {
				height = 0.95,
				width = 0.95,
				preview = {
					horizontal = "right:40%",
					scrollbar = "border",
				},
			},
			grep = {
				prompt = "❯ ",
				rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=4096 "
					.. "--colors 'match:none' "
					.. "--colors 'match:fg:22,245,163' "
					.. "--colors 'match:style:bold' "
					.. "--colors 'path:fg:192,192,192' "
					.. "--colors 'path:style:bold' -e",
			},
		},
	},
	{
		"iamcco/markdown-preview.nvim",
		event = "VeryLazy",
		build = "cd app && yarn install",
	},
	{
		"nvim-tree/nvim-tree.lua",
		event = "VeryLazy",
		opts = {
			view = {
				width = 35,
			},
			actions = {
				open_file = {
					quit_on_open = true,
				},
			},
		},
		config = function()
			local api = require("nvim-tree.api")

			local HEIGHT_RATIO = 0.8 -- You can change this
			local WIDTH_RATIO = 0.5 -- You can change this too

			require("nvim-tree").setup({
				renderer = {
					icons = {
						web_devicons = {
							file = {
								color = false,
							},
						},
						show = {
							file = true,
							folder = false,
							folder_arrow = true,
							git = true,
							modified = true,
							hidden = false,
							diagnostics = true,
							bookmarks = true,
						},
					},
				},
				view = {
					float = {
						enable = true,
						open_win_config = function()
							local screen_w = vim.opt.columns:get()
							local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
							local window_w = screen_w * WIDTH_RATIO
							local window_h = screen_h * HEIGHT_RATIO
							local window_w_int = math.floor(window_w)
							local window_h_int = math.floor(window_h)
							local center_x = (screen_w - window_w) / 2
							local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
							return {
								border = "rounded",
								relative = "editor",
								row = center_y,
								col = center_x,
								width = window_w_int,
								height = window_h_int,
							}
						end,
					},
					width = function()
						return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
					end,
				},
			})

			api.events.subscribe(api.events.Event.FileCreated, function(file)
				vim.cmd("vsplit " .. file.fname)
			end)
		end,
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
	},
	-- {
	-- 	"roberte777/keep-it-secret.nvim",
	-- 	config = function()
	-- 		require("keep-it-secret").setup({
	-- 			wildcards = { ".*(.env)$", ".*(.secret)$" },
	-- 			enabled = true,
	-- 		})
	-- 	end,
	-- },
}
