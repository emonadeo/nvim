local persistence = require("persistence")

persistence.setup()

vim.keymap.set("n", "<leader>qs", persistence.load, { desc = "Load session of current directory" })
vim.keymap.set("n", "<leader>qS", persistence.select, { desc = "Select session" })
vim.keymap.set("n", "<leader>qd", persistence.stop, { desc = "Stop persistence" })
vim.keymap.set(
	"n",
	"<leader>ql",
	function() persistence.load({ last = true }) end,
	{ desc = "Load last session" }
)
