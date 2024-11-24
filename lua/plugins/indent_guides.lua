return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	---@module "ibl"
	---@type ibl.config
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
		scope = { enabled = false },
		whitespace = {
			highlight = {
				"Whitespace",
			},
		},
	},
}
