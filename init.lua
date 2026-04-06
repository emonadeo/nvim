vim.pack.add({
	"https://github.com/MeanderingProgrammer/render-markdown.nvim",
	"https://github.com/chrisgrieser/nvim-spider",
	"https://github.com/folke/lazydev.nvim",
	"https://github.com/folke/persistence.nvim",
	"https://github.com/folke/snacks.nvim",
	"https://github.com/folke/todo-comments.nvim",
	"https://github.com/folke/trouble.nvim",
	"https://github.com/folke/twilight.nvim",
	"https://github.com/folke/which-key.nvim",
	"https://github.com/folke/zen-mode.nvim",
	"https://github.com/j-hui/fidget.nvim",
	"https://github.com/mfussenegger/nvim-jdtls",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-mini/mini.ai",
	"https://github.com/nvim-mini/mini.diff",
	"https://github.com/nvim-mini/mini.icons",
	"https://github.com/nvim-mini/mini.operators",
	"https://github.com/nvim-mini/mini.pairs",
	"https://github.com/nvim-mini/mini.surround",
	"https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
	"https://github.com/rachartier/tiny-inline-diagnostic.nvim",
	"https://github.com/rafamadriz/friendly-snippets",
	"https://github.com/rcarriga/nvim-notify",
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/windwp/nvim-ts-autotag",
	{ src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
	-- Stick to tagged releases which provide prebuilt binaries
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("*") },
})

require("lazydev").setup()
require("mini.ai").setup()
require("mini.operators").setup()
require("mini.surround").setup({ silent = true })
require("nvim-ts-autotag").setup()
require("fidget").setup({
	notification = {
		window = {
			winblend = 0,
		},
	},
})

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("n", "<leader>w", vim.cmd.write, { desc = "Write" })

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
