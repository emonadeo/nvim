local zen = require("zen-mode")

zen.setup({
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
})

vim.keymap.set("n", "<leader>z", function() zen.toggle() end, { desc = "Toggle Zen Mode" })
