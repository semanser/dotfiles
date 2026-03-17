return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = "VeryLazy",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = {
					"bash",
					"css",
					"dockerfile",
					"go",
					"html",
					"java",
					"javascript",
					"json",
					"lua",
					"php",
					"python",
					"query",
					"regex",
					"rust",
					"sql",
					"svelte",
					"toml",
					"tsx",
					"typescript",
					"vue",
					"xml",
					"yaml",
          "comment",
          "eex",
          "elixir",
          "gomod",
          "gosum",
          "gotmpl",
          "gowork",
          "heex",
          "hurl"
				},
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
}
