require("catppuccin").setup({
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
		mini = {
			enabled = true,
		},
		notify = true,
		octo = true,
		oil = true,
		lsp_trouble = true,
		render_markdown = true,
		snacks = {
			enabled = true,
		},
		lualine = {
			all = function(c)
				return {
					normal = { b = { fg = c.text } },
					insert = { b = { fg = c.text } },
					terminal = { b = { fg = c.text } },
					command = { b = { fg = c.text } },
					visual = { b = { fg = c.text } },
					replace = { b = { fg = c.text } },
				}
			end,
		},
		treesitter = true,
		treesitter_context = true,
		which_key = true,
	},
	custom_highlights = function()
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
		}
	end,
})

vim.cmd.colorscheme("catppuccin")
