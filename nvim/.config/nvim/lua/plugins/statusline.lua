return {
	{
		"hoob3rt/lualine.nvim",
		event = "VeryLazy",
		opts = {
			options = {
				-- theme = "catppuccin",
				icons_enabled = false,
				globalstatus = false,
			},
			sections = {
				lualine_a = { "" },
				lualine_b = {
					{
						"diagnostics",
						symbols = {
							error = "✖ ",
							warn = "⚠ ",
							info = "ℹ ",
              hint = " ",
						},
					},
				},
				lualine_c = {
					{
						"filename",
						path = 0,
						color = function(section)
							return { fg = vim.fn.mode() == "i" and accent or primary }
						end,
					},
				},
				lualine_x = { "" },
				lualine_y = { "searchcount" },
				lualine_z = { "location" },
			},
		},
	},
}
