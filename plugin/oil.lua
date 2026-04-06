local oil = require("oil")

-- TODO: Configure
oil.setup()

-- TODO:
-- vim.keymap.set("n", "<leader>ee", function() oil.open() end, { desc = "Current working directory" })

vim.keymap.set("n", "<leader>ef", function() oil.open() end, { desc = "File directory" })

vim.keymap.set(
	"n",
	"<leader>ec",
	function() oil.open(vim.fn.stdpath("config")) end,
	{ desc = "Config directory" }
)
