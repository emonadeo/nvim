return {
	{
		"folke/zen-mode.nvim",
		opts = {
			window = {
				backdrop = 1,
				width = 100,
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
			{
				"<leader>z",
				function() require("zen-mode").toggle() end,
				desc = "Toggle Zen Mode",
			},
		},
	},
	{
		"folke/twilight.nvim",
	},
}
