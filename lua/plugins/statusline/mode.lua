local utils = require("heirline.utils")

-- TODO: don't hardcode catppuccin
local catppuccin = require("catppuccin.palettes").get_palette()

local M = {}

local modes = {
	["n"] = { text = "NORMAL", color = catppuccin.green },
	["v"] = { text = "VISUAL", color = catppuccin.blue },
	["V"] = { text = "V-LINE", color = catppuccin.blue },
	["\22"] = { text = "V-BLOCK", color = catppuccin.blue },
	["s"] = { text = "SELECT", color = catppuccin.yellow },
	["S"] = { text = "S-LINE", color = catppuccin.yellow },
	["\19"] = { text = "S-BLOCK", color = catppuccin.yellow },
	["i"] = { text = "INSERT", color = catppuccin.red },
	["R"] = { text = "REPLACE", color = catppuccin.red },
	["c"] = { text = "COMMAND", color = catppuccin.lavender },
	["r"] = { text = "PROMPT", color = catppuccin.lavender },
	["!"] = { text = "SHELL", color = catppuccin.lavender },
	["t"] = { text = "TERMINAL", color = catppuccin.lavender },
}

M.init = function(self)
	self.mode = vim.fn.mode()
end

M.provider = function(self)
	return modes[self.mode].text
end

M.hl = function()
	return { fg = catppuccin.mantle, bg = modes[vim.fn.mode()].color, bold = true }
end

-- wrap component with powerline symbols
M = utils.surround({ "", "" }, function()
	return modes[vim.fn.mode()].color
end, { M })

return M
