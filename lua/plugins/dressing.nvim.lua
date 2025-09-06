return {
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy", -- lazy load on a common low-priority event
		config = function()
			require("dressing").setup({
				-- You can configure dressing.nvim options here, for example:
				input = { enabled = true },
				select = { enabled = true },
			})
		end,
	},
}
