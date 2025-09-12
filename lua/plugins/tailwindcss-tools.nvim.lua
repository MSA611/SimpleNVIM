return {
	{
		"luckasRanarison/tailwind-tools.nvim",
		dependencies = { "neovim/nvim-lspconfig" },
		opts = {
			document_color = {
				enabled = true,
				kind = "background", -- or "inline"
			},
			conceal = {
				enabled = false, -- Set to true if you want to hide long class names
			},
		},
	},
}
