return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local keymap = vim.keymap

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }

				-- Load LazyVim default LSP keymaps
				-- local lazy_keys = require("lazyvim.plugins.lsp.keymaps").get()
				-- for _, key in ipairs(lazy_keys) do
				-- 	local mode = key.mode or "n"
				-- 	keymap.set(
				-- 		mode,
				-- 		key[1],
				-- 		key[2],
				-- 		vim.tbl_extend("force", { buffer = ev.buf, silent = true, desc = key.desc }, key.opts or {})
				-- 	)
				-- end

				-- LSP Info
				keymap.set("n", "<leader>cl", "<cmd>LspInfo<cr>", vim.tbl_extend("force", opts, { desc = "Lsp Info" }))

				-- Navigation
				keymap.set(
					"n",
					"gd",
					"<cmd>FzfLua lsp_definitions jump1=true ignore_current_line=true<cr>",
					vim.tbl_extend("force", opts, { desc = "Goto Definition" })
				)
				keymap.set(
					"n",
					"gr",
					"<cmd>FzfLua lsp_references jump1=true ignore_current_line=true<cr>",
					vim.tbl_extend("force", opts, { desc = "References", nowait = true })
				)
				keymap.set(
					"n",
					"gI",
					"<cmd>FzfLua lsp_implementations jump1=true ignore_current_line=true<cr>",
					vim.tbl_extend("force", opts, { desc = "Goto Implementation" })
				)
				keymap.set(
					"n",
					"gy",
					"<cmd>FzfLua lsp_typedefs jump1=true ignore_current_line=true<cr>",
					vim.tbl_extend("force", opts, { desc = "Goto T[y]pe Definition" })
				)
				keymap.set(
					"n",
					"gD",
					vim.lsp.buf.declaration,
					vim.tbl_extend("force", opts, { desc = "Goto Declaration" })
				)

				-- Hover and Help
				keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover" }))
				keymap.set(
					"n",
					"gK",
					vim.lsp.buf.signature_help,
					vim.tbl_extend("force", opts, { desc = "Signature Help" })
				)
				keymap.set(
					"i",
					"<c-k>",
					vim.lsp.buf.signature_help,
					vim.tbl_extend("force", opts, { desc = "Signature Help" })
				)

				-- Code Actions
				keymap.set(
					{ "n", "v" },
					"<leader>ca",
					vim.lsp.buf.code_action,
					vim.tbl_extend("force", opts, { desc = "Code Action" })
				)
				keymap.set(
					{ "n", "v" },
					"<leader>cc",
					vim.lsp.codelens.run,
					vim.tbl_extend("force", opts, { desc = "Run Codelens" })
				)
				keymap.set(
					"n",
					"<leader>cC",
					vim.lsp.codelens.refresh,
					vim.tbl_extend("force", opts, { desc = "Refresh & Display Codelens" })
				)

				-- Rename
				keymap.set("n", "<leader>cr", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename" }))

				-- Source Action
				keymap.set("n", "<leader>cA", function()
					vim.lsp.buf.code_action({
						context = {
							only = { "source" },
							diagnostics = {},
						},
					})
				end, vim.tbl_extend("force", opts, { desc = "Source Action" }))

				-- Diagnostics
				keymap.set(
					"n",
					"<leader>D",
					"<cmd>Telescope diagnostics bufnr=0<CR>",
					vim.tbl_extend("force", opts, { desc = "Buffer Diagnostics" })
				)
				keymap.set(
					"n",
					"<leader>d",
					vim.diagnostic.open_float,
					vim.tbl_extend("force", opts, { desc = "Line Diagnostics" })
				)
				keymap.set(
					"n",
					"[d",
					vim.diagnostic.goto_prev,
					vim.tbl_extend("force", opts, { desc = "Prev Diagnostic" })
				)
				keymap.set(
					"n",
					"]d",
					vim.diagnostic.goto_next,
					vim.tbl_extend("force", opts, { desc = "Next Diagnostic" })
				)

				-- LSP Restart
				keymap.set(
					"n",
					"<leader>rs",
					":LspRestart<CR>",
					vim.tbl_extend("force", opts, { desc = "Restart LSP" })
				)
			end,
		})

		-- Setup capabilities for LSP servers with cmp-nvim-lsp
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Configure diagnostic signs
		vim.diagnostic.config({
			signs = {
				severity = {
					min = vim.diagnostic.severity.ERROR,
				},
				text = {
					[vim.diagnostic.severity.ERROR] = " ",
					[vim.diagnostic.severity.WARN] = " ",
					[vim.diagnostic.severity.HINT] = "󰠠 ",
					[vim.diagnostic.severity.INFO] = " ",
				},
			},
		})

		-- Apply capabilities to all servers
		vim.lsp.config("*", {
			capabilities = capabilities,
		})

		-- Example server specific configurations
		vim.lsp.config("svelte", {
			on_attach = function(client, bufnr)
				vim.api.nvim_create_autocmd("BufWritePost", {
					pattern = { "*.js", "*.ts" },
					callback = function(ctx)
						client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
					end,
				})
			end,
		})

		vim.lsp.config("jdtls", {
			filetypes = { "java" },
		})

		vim.lsp.config("graphql", {
			filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
		})

		vim.lsp.config("emmet_ls", {
			filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
		})

		vim.lsp.config("eslint", {
			filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
		})

		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					completion = {
						callSnippet = "Replace",
					},
				},
			},
		})
	end,
}
