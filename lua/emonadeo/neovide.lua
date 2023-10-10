vim.g.neovide_floating_blur_amount_x = 4.0
vim.g.neovide_floating_blur_amount_y = 4.0

vim.g.neovide_cursor_vfx_mode = "railgun"
vim.g.neovide_cursor_vfx_particle_density = 14.0

vim.g.neovide_padding_top = 0
vim.g.neovide_padding_bottom = 16
vim.g.neovide_padding_right = 48
vim.g.neovide_padding_left = 48

local alpha = function()
	return string.format("%x", math.floor(255 * vim.g.transparency or 0.8))
end

-- vim.g.neovide_transparency = 0.0
-- vim.g.transparency = 1.0
vim.g.neovide_background_color = "#1e1e2e"
