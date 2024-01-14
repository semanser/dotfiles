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
		event = "VeryLazy",
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
		opts = {},
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
}
