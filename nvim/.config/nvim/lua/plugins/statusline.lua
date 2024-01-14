return {
	"hoob3rt/lualine.nvim",
	opts = {
		options = {
			theme = "catppuccin",
			icons_enabled = true,
			globalstatus = false,
		},
		sections = {
			lualine_a = { "" },
			lualine_b = { "diagnostics" },
			lualine_c = {
				{
					"filename",
					path = 0,
				},
			},
			lualine_x = { "" },
			lualine_y = { "searchcount" },
			lualine_z = { "location" },
		},
	},
}
