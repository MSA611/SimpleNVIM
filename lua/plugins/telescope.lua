-- return {
-- 	'nvim-telescope/telescope.nvim',
-- 	keys = {
-- 		{"<leader><space>", "<cmd>Telescope find_files<cr>"},
-- 		{"<leader>,", "<cmd>Telescope buffers<cr>"},
-- 		{"<leader>/", "<cmd>Telescope live_grep<cr>"},
-- 	},
-- 	tag = '0.1.8',
-- 	dependencies = {
-- 		'nvim-lua/plenary.nvim'
-- 	}
-- }

return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8", -- or use branch = '0.1.x' for the latest release branch
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				config = function()
					-- Load FZF extension safely
					pcall(function()
						require("telescope").load_extension("fzf")
					end)
				end,
			},
		},
		config = function()
			require("telescope").setup({
				defaults = {
					prompt_prefix = " ",
					selection_caret = " ",
					mappings = {
						i = {
							-- Only valid Telescope actions here!
							["<C-Down>"] = require("telescope.actions").cycle_history_next,
							["<C-Up>"] = require("telescope.actions").cycle_history_prev,
							["<C-f>"] = require("telescope.actions").preview_scrolling_down,
							["<C-b>"] = require("telescope.actions").preview_scrolling_up,
							-- Remove all mouse or unsupported actions!
						},
						n = {
							["q"] = require("telescope.actions").close,
						},
					},
				},
				pickers = {
					find_files = {
						find_command = { "fd", "--type", "f", "--color", "never", "-E", ".git" },
						hidden = true,
					},
				},
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
				},
			})
		end,
		keys = {
			{ "<leader><space>", "<cmd>Telescope find_files<cr>", desc = "Find Files (Root Dir)" },
			{ "<leader>/", "<cmd>Telescope live_grep<cr>", desc = "Text Grep (Root Dir)" },
			{ "<leader>,", "<cmd>Telescope buffers<cr>", desc = "Switch Buffer" },
			{ "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
			{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
			{ "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "Find Git Files" },
			{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },
			{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
			{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
			{ "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
			{ "<leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "Workspace Diagnostics" },
			-- Add more keymaps as desired
		},
	},
}
