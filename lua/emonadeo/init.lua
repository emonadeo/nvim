require("emonadeo.neovide")
require("emonadeo.keymap")

vim.opt.guifont = { "FiraCode Nerd Font Mono", ":h16" }
vim.opt.bufhidden = "wipe"
vim.opt.tabstop = 4
vim.opt.shiftwidth = 0
vim.opt.list = true
-- vim.opt.linespace = 16

-- Visible Whitespace
vim.opt.listchars:append("tab:>-")
vim.opt.listchars:append("space:⋅")

-- Do not break long lines
vim.opt.wrap = false

-- Disable laststatus
-- vim.opt.laststatus = 0
