return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {
		indent = {
			char = "│", -- or "│", "▏", "▎"
			tab_char = "│", -- or "│", "▏", "▎"
			highlight = {
				"Whitespace",
			},
			smart_indent_cap = true,
			priority = 1,
		},
		whitespace = {
			highlight = {
				"Whitespace",
			},
		},
		scope = { enabled = false },
	},
}
