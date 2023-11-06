require("emonadeo.neovide")
require("emonadeo.keymap")

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.guifont = "GeistMono Nerd Font Mono:h16"
vim.opt.bufhidden = "wipe"
vim.opt.tabstop = 4
vim.opt.shiftwidth = 0
vim.opt.list = true
-- vim.opt.linespace = 16

-- Visible Whitespace
vim.opt.listchars:append("tab:──")
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("trail:⋅")

-- Do not break long lines
vim.opt.wrap = false

-- Sync with system clipboard
vim.opt.clipboard = "unnamedplus"

vim.opt.showmode = false -- Dont show mode since we have a statusline
vim.opt.laststatus = 0
vim.opt.cmdheight = 0
