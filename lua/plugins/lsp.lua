return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
		},

		vim.diagnostic.config({
			virtual_text = {
				spacing = 2,
				prefix = "●",
				severity_sort = true,
			},
			update_in_insert = false, -- CRITICAL: Don't update in insert mode
			severity_sort = true,
			float = {
				border = "rounded",
				source = "always",
			},
		}),

		opts = {
			servers = {
				lua_ls = {
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" },
							},
						},
					},
				},
				tsserver = {},
				-- vtsls = {},
				eslint = {},
				tailwindcss = {},
				emmet_language_server = {},
				jdtls = {},
				html = {},
				cssls = {},
				marksman = {},
			},
		},

		flags = {
			debounce_text_changes = 150, -- Add debouncing for performance
		},
		config = function(_, opts)
			require("mason").setup()

			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "eslint", "ts_ls" },
			})

			for server, config in pairs(opts.servers) do
				vim.lsp.config(server, config)
				vim.lsp.enable(server)
			end
		end,
	},
}
