return {
	"chrishrb/gx.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = { { "gx", "<cmd>Browse<cr>", mode = { "n", "x" } } },
	cmd = { "Browse" },
	config = true,
	init = function()
		vim.g.netrw_nogx = 1 -- disable netrw gx
	end,
}
