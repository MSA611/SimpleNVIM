return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			cmdline = {
				view = "cmdline",
			},
			presets = {
				command_palette = false,
			},
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			{
				"rcarriga/nvim-notify",
				opts = {
					timeout = 1000,
					stages = "static",
				},
			},
		},
	},
}
