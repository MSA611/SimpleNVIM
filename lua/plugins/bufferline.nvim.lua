return {
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		version = "*",
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- for file icons
		},
		config = function()
			require("bufferline").setup({})
		end,
	},
}
