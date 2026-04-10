require("blink.cmp").setup({
	appearance = {
		use_nvim_cmp_as_default = true,
		nerd_font_variant = "normal",
	},
	completion = {
		documentation = {
			auto_show = true,
		},
		list = {
			selection = {
				preselect = true,
				auto_insert = false,
			},
		},
		menu = {
			auto_show = false,
			enabled = true,
			draw = {
				components = {
					kind_icon = {
						ellipsis = false,
						text = function(ctx)
							local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
							return kind_icon
						end,
						-- Optionally, you may also use the highlights from mini.icons
						highlight = function(ctx)
							local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
							return hl
						end,
					},
				},
			},
		},
	},
	keymap = {
		preset = "none",
		["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
		-- BUG: Cannot select next or prev when completion menu is hidden
		["<C-h>"] = { "hide", "snippet_backward", "fallback" },
		["<C-j>"] = { "select_next", "fallback" },
		["<C-k>"] = { "select_prev", "fallback" },
		["<C-l>"] = { "accept", "snippet_forward", "fallback" },
		["<C-u>"] = { "scroll_documentation_up", "fallback" },
		["<C-d>"] = { "scroll_documentation_down", "fallback" },
		["<C-s>"] = { "show_signature", "hide_signature", "fallback" },
	},
	signature = {
		enabled = true,
	},
	sources = {
		default = { "lsp", "path", "snippets", "buffer", "lazydev" },
		providers = {
			lazydev = {
				name = "LazyDev",
				module = "lazydev.integrations.blink",
			},
			snippets = {
				opts = {
					friendly_snippets = true,
				},
			},
		},
	},
	cmdline = {
		keymap = { preset = "inherit" },
		completion = {
			menu = { auto_show = true },
			list = {
				selection = {
					preselect = true,
					auto_insert = false,
				},
			},
		},
	},
	fuzzy = {
		implementation = "prefer_rust_with_warning",
		frecency = {
			enabled = false,
		},
		sorts = {
			"exact",
			"score",
			"sort_text",
		},
	},
})
