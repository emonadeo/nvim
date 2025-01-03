return {
	{
		"folke/lazydev.nvim",
		ft = "lua",
	},
	{
		"Saghen/blink.cmp",
		version = "*",
		dependencies = {
			"echasnovski/mini.icons",
			"giuxtaposition/blink-cmp-copilot",
			"rafamadriz/friendly-snippets",
		},
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "normal",
			},
			completion = {
				documentation = {
					auto_show = true,
					window = {
						border = "rounded",
						winblend = 50,
					},
				},
				menu = {
					enabled = true,
					border = "rounded",
					winblend = 50,
					draw = {
						components = {
							kind_icon = {
								ellipsis = false,
								text = function(ctx)
									local kind_icon, _, _ =
										require("mini.icons").get("lsp", ctx.kind)
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
			keymap = { preset = "default" },
			signature = {
				enabled = true,
				window = {
					border = "rounded",
					winblend = 50,
				},
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer", "lazydev", "copilot" },
				providers = {
					copilot = {
						name = "copilot",
						module = "blink-cmp-copilot",
						async = true,
						transform_items = function(_, items)
							local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
							local kind_idx = #CompletionItemKind + 1
							CompletionItemKind[kind_idx] = "Copilot"
							for _, item in ipairs(items) do
								item.kind = kind_idx
							end
							return items
						end,
					},
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
					},
				},
			},
		},
		opts_extend = { "sources.default" },
	},
}
