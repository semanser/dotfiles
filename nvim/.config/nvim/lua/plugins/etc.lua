return {
	"neovim/nvim-lspconfig",
	"RRethy/vim-illuminate",
	"christoomey/vim-tmux-navigator",
	{
		"folke/trouble.nvim",
		opts = {
			auto_close = true,
			padding = false,
			fold_open = "↓",
			fold_closed = "→",
			icons = false,
			use_diagnostic_signs = true,
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
		build = "cd app && yarn install",
	},
	{
		"nvim-tree/nvim-tree.lua",
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
