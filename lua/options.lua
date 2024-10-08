vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 0

-- Visible Whitespace
vim.opt.list = true
vim.opt.listchars:append("tab:──")
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("trail:⋅")

-- Do not break long lines
vim.opt.wrap = false

-- Sync with system clipboard
vim.opt.clipboard = "unnamedplus"

vim.opt.showmode = false -- Dont show mode since we have a statusline
vim.opt.laststatus = 2
vim.opt.cmdheight = 0

-- Folding
vim.opt.foldenable = true
vim.opt.foldlevel = 100
vim.opt.foldlevelstart = 100

local signs = { Error = " ", Warn = " ", Hint = "󱠂 ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
