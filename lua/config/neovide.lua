vim.g.neovide_padding_top = 48
vim.g.neovide_padding_bottom = 48
vim.g.neovide_padding_right = 48
vim.g.neovide_padding_left = 48

vim.g.neovide_show_border = true

vim.g.neovide_floating_blur_amount_x = 8.0
vim.g.neovide_floating_blur_amount_y = 8.0
vim.g.neovide_floating_shadow = false

vim.g.neovide_underline_stroke_scale = 2.0

-- TODO: Translucent background
-- Floating windows cannot hide what's behind them without disabling multigrid
-- See <https://github.com/neovide/neovide/discussions/2970>
vim.g.neovide_normal_opacity = 1.0
vim.g.neovide_opacity = 1.0

-- from 0 (opaque) to 100 (transparent)
vim.opt.winblend = 50
vim.opt.pumblend = 50
