require("keymap")
require("options")

if vim.g.neovide then
	require("neovide")
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
	install = {
		colorscheme = { "catppuccin" },
	},
	ui = {
		border = "rounded",
	},
})

vim.filetype.add({
	pattern = {
		[".*/dockerfile"] = "dockerfile",
		[".*/dockerfile%.%a+"] = "dockerfile",
		[".*/containerfile"] = "dockerfile",
		[".*/containerfile%.%a+"] = "dockerfile",
	},
})

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
