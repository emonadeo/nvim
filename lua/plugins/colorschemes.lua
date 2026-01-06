return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 1000,
	opts = {
		no_italic = true,
		transparent_background = true,
		default_integrations = false,
		lsp_styles = {
			virtual_text = {
				errors = {},
				hints = {},
				warnings = {},
				information = {},
				ok = {},
			},
			underlines = {
				errors = { "undercurl" },
				hints = { "underdotted" },
				warnings = { "undercurl" },
				information = { "underdotted" },
				ok = { "underdashed" },
			},
		},
		integrations = {
			blink_cmp = true,
			dap = true,
			dap_ui = true,
			fidget = true,
			gitsigns = true,
			indent_blankline = {
				enabled = true,
			},
			mini = {
				enabled = true,
			},
			navic = {
				enabled = true,
			},
			notify = true,
			octo = true,
			lsp_trouble = true,
			render_markdown = true,
			snacks = {
				enabled = false,
				indent_scope_color = "",
			},
			treesitter = true,
			treesitter_context = true,
			which_key = true,
		},
		custom_highlights = function(colors)
			return {
				-- Blink
				BlinkCmpDocBorder = { link = "FloatBorder" },
				BlinkCmpMenu = { link = "NormalFloat" },
				BlinkCmpMenuBorder = { link = "FloatBorder" },
				BlinkCmpMenuSelection = { link = "Visual" },
				BlinkCmpSignatureHelpBorder = { link = "FloatBorder" },
				-- Color Column
				ColorColumn = { link = "CursorLine" },
				-- Folds
				Folded = { link = "CursorLine" },
				-- Disable background of statusline; we use heirline.nvim (see statusline.lua)
				StatusLine = { bg = colors.none },
				StatusLineNC = { bg = colors.none },
			}
		end,
	},
	config = function(_, opts)
		require("catppuccin").setup(opts)
		vim.cmd.colorscheme("catppuccin")
	end,
}
