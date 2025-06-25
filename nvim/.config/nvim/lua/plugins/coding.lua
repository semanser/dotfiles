return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",
	},
	{
		"neoclide/vim-jsx-improve",
		event = "VeryLazy",
	},
	{
		"machakann/vim-sandwich",
		event = "InsertEnter",
	},
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = {
					enabled = false,
				},
				panel = {
					enabled = false,
				},
				filetypes = {
					["*"] = false,
					astro = true,
					typescriptreact = true,
					css = true,
					sql = true,
					eruby = true,
					go = true,
					html = true,
					javascript = true,
					lua = true,
					php = true,
					ruby = true,
					rust = true,
					typescript = true,
					vue = true,
					markdown = true,
					yaml = true,
					dockerfile = true,
          elixir = true,
          heex = true,
          swift = true,
				},
				server_opts_overrides = {},
			})
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		event = "InsertEnter",
		after = { "copilot.lua" },
		config = function()
			require("copilot_cmp").setup()
		end,
	},
}
