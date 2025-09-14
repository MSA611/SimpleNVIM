return {
	"szw/vim-maximizer",
	-- event = { "BufReadPre", "BufNewFile" },
	event = "VeryLazy",
	keys = {
		{ "<leader>wm", "<cmd>MaximizerToggle<CR>", desc = "Maximize/minimize a split" },
	},
}
