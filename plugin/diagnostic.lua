local signs = { Error = "", Warn = "", Hint = "󱠂", Info = "" }

for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.keymap.set("n", "gh", vim.diagnostic.open_float)

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
-- Disable default virtual text
vim.diagnostic.config({ virtual_text = false })
