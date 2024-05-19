return {
	-- tokyonight
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		lazy = true,
	},

	-- catppuccin
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		lazy = true,
		opts = {
			no_italic = true,
			integrations = {
				native_lsp = {
					enabled = true,
					underlines = {
						errors = { "undercurl" },
						hints = { "undercurl" },
						warnings = { "undercurl" },
						information = { "undercurl" },
					},
				},
			},
			custom_highlights = function(colors)
				return {
					Folded = { link = "Normal" },
					UfoFoldedEllipsis = { link = "Normal" },
					-- disable background of statusline; we use heirline.nvim (see statusline.lua)
					StatusLine = { bg = colors.none },
					StatusLineNC = { bg = colors.none },
				}
			end,
		},
	},
}
