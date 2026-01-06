vim.keymap.set("n", "<leader>w", vim.cmd.write, { desc = "Write" })

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.o.number = true
vim.o.relativenumber = true

vim.o.tabstop = 4
vim.o.shiftwidth = 0

-- Visible Whitespace
vim.o.list = true
-- TODO: Replace with `vim.o` once it supports tables
-- See <https://github.com/neovim/neovim/issues/20107>
vim.opt.listchars = {
	tab = "──",
	space = "⋅",
	trail = "⋅",
}

-- Do not break long lines
vim.o.wrap = false

-- Sync with system clipboard
vim.o.clipboard = "unnamedplus"

vim.o.showmode = false -- Dont show mode since we have a statusline
vim.o.laststatus = 2
vim.o.cmdheight = 0

-- Fold
vim.o.foldenable = true
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldlevel = 99
vim.o.foldmethod = "expr"
vim.o.foldtext = ""
-- TODO: Replace with `vim.o` once it supports tables
-- See <https://github.com/neovim/neovim/issues/20107>
vim.opt.fillchars = {
	foldopen = "",
	foldclose = "",
	fold = " ",
	foldsep = " ",
	diff = "╱",
	eob = " ",
}

vim.o.shiftwidth = 2
vim.o.colorcolumn = "80"

vim.o.winborder = "rounded"

-- Set working directory when launching NeoVim
-- local group_cdpwd = vim.api.nvim_create_augroup("cdpwd", { clear = true })
-- vim.api.nvim_create_autocmd("VimEnter", {
-- 	pattern = "*",
-- 	group = group_cdpwd,
-- 	callback = function()
-- 		-- https://neovim.io/doc/user/builtin.html#expand()
-- 		local current_dir = vim.fn.expand("%:p:h")
-- 		vim.api.nvim_set_current_dir(current_dir)
-- 	end,
-- })
