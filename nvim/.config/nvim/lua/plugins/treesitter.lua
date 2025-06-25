return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = "VeryLazy",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = {
					"lua",
					"sql",
					"javascript",
					"go",
					"xml",
					"json",
					"typescript",
					"tsx",
					"html",
					"css",
					"yaml",
					"toml",
					"rust",
					"bash",
					"python",
					"dockerfile",
					"vue",
					"svelte",
					"php",
					"java",
					"regex",
					"query",
          "elixir",
          "heex",
          "eex"
				},
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
}
