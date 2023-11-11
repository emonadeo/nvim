return {
	-- zen mode
	{
		"folke/zen-mode.nvim",
		opts = {
			window = {
				backdrop = 1,
				width = 80,
				height = 1,
			},
			plugins = {
				options = {
					enabled = true,
					laststatus = 0,
				},
			},
		},
		keys = {
			{ "<leader>z", "<cmd>ZenMode<cr>", desc = "Toggle Zen Mode" },
		},
	},

	-- fade out inactive text blocks
	{
		"folke/twilight.nvim",
	}
}
