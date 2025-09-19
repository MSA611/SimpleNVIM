return {
	{
		"folke/noice.nvim",
		event = "VeryLazy", -- Lazy load on this event for performance
		opts = {
			-- Add any noice.nvim configuration options here if needed
			cmdline = {
				view = "cmdline", -- Place cmdline at the bottom of the window (default Vim style)
			},
		},
	},
}
