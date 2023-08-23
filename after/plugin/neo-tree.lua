vim.keymap.set("n", "<leader>E", "<cmd>Neotree toggle<cr>", { desc = "Toggle File Explorer" })
vim.keymap.set("n", "<leader>e", function()
	if vim.bo.filetype == "neo-tree" then
		vim.cmd.wincmd("p")
	else
		vim.cmd.Neotree("focus")
	end
end, { desc = "Focus File Explorer" })
