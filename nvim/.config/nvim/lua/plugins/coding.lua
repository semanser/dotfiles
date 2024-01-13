return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	"terrortylor/nvim-comment",
	"neoclide/vim-jsx-improve",
	"machakann/vim-sandwich",
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = {
					auto_trigger = true,
					debounce = 100,
					keymap = {
						accept = "<C-l>",
					},
				},
				filetypes = {
					typescriptreact = true,
					css = true,
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
		dependencies = {
			"zbirenbaum/copilot-cmp",
		},
	},
}
