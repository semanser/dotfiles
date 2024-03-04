return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
  {
    'numToStr/Comment.nvim',
    opts = {},
    lazy = false,
  },
	"neoclide/vim-jsx-improve",
	"machakann/vim-sandwich",
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
					["*"] = false,
				},
				server_opts_overrides = {},
			})
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		after = { "copilot.lua" },
		config = function()
			require("copilot_cmp").setup()
		end,
	},
}
