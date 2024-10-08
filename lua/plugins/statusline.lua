return {
	"rebelot/heirline.nvim",
	event = "UiEnter",
	dependencies = { "catppuccin/nvim", "echasnovski/mini.icons" },
	opts = function()
		local conditions = require("heirline.conditions")
		local utils = require("heirline.utils")

		local mode = require("plugins.statusline.mode")
		local file_icon = require("plugins.statusline.file_icon")
		local file_name = require("plugins.statusline.file_name")

		local _ = { provider = " " }

		local function setup_colors()
			-- TODO: don't hardcode catppuccin
			return require("catppuccin.palettes").get_palette()
		end

		vim.api.nvim_create_augroup("Heirline", { clear = true })
		vim.api.nvim_create_autocmd("ColorScheme", {
			callback = function()
				utils.on_colorscheme(setup_colors)
			end,
			group = "Heirline",
		})

		require("heirline").load_colors(setup_colors())

		return {
			statusline = {
				{ mode, _, condition = conditions.is_active },
				{ provider = "", hl = { fg = "mantle" } },
				{
					file_icon,
					_,
					file_name,
					-- fill up space
					{ provider = "%=" },
					-- settings
					hl = {
						bg = "mantle",
					},
				},
				{ provider = "", hl = { fg = "mantle" } },
			},
		}
	end,
}
