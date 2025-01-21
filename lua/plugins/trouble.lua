-- TODO: Refine
return {
	"folke/trouble.nvim",
	dependencies = { "echasnovski/mini.icons" },
	opts = {},
	cmd = "Trouble",
	keys = {
		{
			"<leader>ed",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Diagnostics (Trouble)",
		},
		{
			"<leader>eD",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "Buffer Diagnostics (Trouble)",
		},
		{
			"<leader>es",
			"<cmd>Trouble symbols toggle focus=false<cr>",
			desc = "Symbols (Trouble)",
		},
	},
}
