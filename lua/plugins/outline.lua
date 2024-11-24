return {
	"stevearc/aerial.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"echasnovski/mini.icons",
	},
	opts = {
		on_attach = function(bufnr)
			vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
			vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
		end,
	},
	keys = {

		{
			"<leader>o",
			function()
				require("aerial").toggle({
					focus = false,
					direction = "right",
				})
			end,
			desc = "Toggle Outline",
		},
	},
}
