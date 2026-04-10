-- Disable default virtual text
vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.HINT] = "󱠂",
			[vim.diagnostic.severity.INFO] = "",
		},
		numhl = {
			[vim.diagnostic.severity.ERROR] = "DiagnosticError",
			[vim.diagnostic.severity.WARN] = "DiagnosticWarn",
			[vim.diagnostic.severity.HINT] = "DiagnosticHint",
			[vim.diagnostic.severity.INFO] = "DiagnosticInfo",
		},
	},
	-- virtual_text = false
})

require("tiny-inline-diagnostic").setup({
	preset = "simple",
	options = {
		show_source = {
			enabled = true,
			if_many = true,
		},
		use_icons_from_diagnostic = true,
	},
})
