vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Common Actions
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })

-- Project
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Exit Neovim" })

-- Splits
vim.keymap.set("n", "<leader>|", "<cmd>vsplit<cr>", { desc = "Vertical Split" })
vim.keymap.set("n", "<leader>\\", "<cmd>split<cr>", { desc = "Horizontal Split" })

-- Move to window using the <ctrl> hjkl keys
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })
