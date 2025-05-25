return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 1000,
	opts = {
		no_italic = true,
		default_integrations = false,
		integrations = {
			blink_cmp = true,
			dap = true,
			dap_ui = true,
			gitsigns = true,
			indent_blankline = {
				enabled = true,
			},
			mini = {
				enabled = true,
				indentscope_color = "",
			},
			native_lsp = {
				enabled = true,
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
				inlay_hints = {
					background = true,
				},
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
			ufo = true,
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
				-- Folds
				Folded = { link = "Normal" },
				UfoFoldedEllipsis = { link = "Normal" },
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
