return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- for file icons
		},
		config = function()
			require("bufferline").setup({})
		end,
	},
}
