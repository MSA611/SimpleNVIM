return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets" },
	event = "InsertEnter",
	version = "1.*",
	opts = {
		keymap = {
			preset = "default",
			["<CR>"] = { "accept", "fallback" },
		},
		appearance = {
			nerd_font_variant = "mono",
		},

		completion = {
			documentation = { auto_show = false, auto_show_delay_ms = 500 },

			menu = {
				max_height = 10, -- Limit completion items
			},
			list = {
				max_items = 50, -- Limit total items for speed
			},
			accept = {
				auto_brackets = {
					enabled = true,
				},
			},
			trigger = {
				prefetch_on_insert = false, -- Disable prefetch for speed
			},
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
			providers = {
				lsp = {
					min_keyword_length = 1,
					score_offset = 100, -- Prioritize LSP
				},
				buffer = {
					min_keyword_length = 3, -- Reduce buffer noise
					max_items = 10,
				},
				path = {
					min_keyword_length = 2,
					max_items = 10,
				},
			},
		},

		fuzzy = {
			implementation = "prefer_rust_with_warning",
			sorts = { "score", "sort_text" },
		},
	},
	opts_extend = { "sources.default" },
}
