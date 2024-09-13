return {
	"neovim/nvim-lspconfig",
	{
		"RRethy/vim-illuminate",
		event = "VeryLazy",
	},
	"christoomey/vim-tmux-navigator",
	{
		"folke/trouble.nvim",
		opts = {
			auto_close = true,
		},
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		"ibhagwan/fzf-lua",
		opts = {
			winopts = {
				height = 0.95,
				width = 0.95,
				preview = {
					horizontal = "right:40%",
					scrollbar = "border",
				},
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
	{
		"roberte777/keep-it-secret.nvim",
		config = function()
			require("keep-it-secret").setup({
				wildcards = { ".*(.env)$", ".*(.secret)$" },
				enabled = true,
			})
		end,
	},
}
