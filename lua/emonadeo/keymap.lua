vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- common actions
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })

-- project
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Exit Neovim" })
