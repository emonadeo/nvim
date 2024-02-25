return {
	"rebelot/heirline.nvim",
	event = "UiEnter",
	opts = function()
		local conditions = require("heirline.conditions")

		-- TODO: don't hardcode catppuccin
		local catppuccin = require("catppuccin.palettes").get_palette()

		local mode = require("plugins.statusline.mode")
		local file_icon = require("plugins.statusline.file_icon")
		local file_name = require("plugins.statusline.file_name")

		local _ = { provider = " " }

		return {
			statusline = {
				{ mode, _, condition = conditions.is_active },
				{ provider = "", hl = { fg = catppuccin.mantle } },
				{
					_,
					file_icon,
					file_name,
					-- fill up space
					{ provider = "%=" },
					-- settings
					hl = {
						bg = catppuccin.mantle,
					},
				},
				{ provider = "", hl = { fg = catppuccin.mantle } },
			},
		}
	end,
}
