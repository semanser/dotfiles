return {
	"hoob3rt/lualine.nvim",
	opts = {
		options = {
			theme = "catppuccin",
			icons_enabled = false,
			component_separators = { "", "" },
			section_separators = { "", "" },
			globalstatus = true,
		},
		sections = {
			lualine_a = { "" },
			lualine_b = { "" },
			lualine_c = {
				{
					"filename",
					path = 1,
				},
			},
			lualine_x = { "" },
			lualine_y = { "location" },
			lualine_z = { { "diagnostics", sources = { "nvim_diagnostic" } } },
		},
	},
}
