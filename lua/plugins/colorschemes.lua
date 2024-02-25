return {
	-- tokyonight
	{
		"folke/tokyonight.nvim",
		priority = 1000,
	},

	-- catppuccin
	{
		"catppuccin/nvim",
		priority = 1000,
		name = "catppuccin",
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
				}
			end,
		},
		init = function()
			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
