return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		-- char = "▏",
		char = "│",
		filetype_exclude = {
			"help",
			"alpha",
			"dashboard",
			"neo-tree",
			"Trouble",
			"lazy",
			"mason",
			"notify",
			"toggleterm",
			"lazyterm",
		},
		show_trailing_blankline_indent = false,
		show_current_context = false,
	},
	config = function()
		require("indent_blankline").setup({
			show_current_context = false,
			show_current_context_start = false,
		}) -- https://github.com/lukas-reineke/indent-blankline.nvim/issues/489
		vim.api.nvim_create_autocmd("CursorMoved", { command = "IndentBlanklineRefresh" })
		vim.api.nvim_create_autocmd("WinScrolled", { command = "IndentBlanklineRefresh" })
	end,
}
