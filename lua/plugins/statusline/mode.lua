local utils = require("heirline.utils")

local M = {}

local modes = {
	["n"] = { text = "NORMAL", color = "green" },
	["v"] = { text = "VISUAL", color = "blue" },
	["V"] = { text = "V-LINE", color = "blue" },
	["\22"] = { text = "V-BLOCK", color = "blue" },
	["s"] = { text = "SELECT", color = "yellow" },
	["S"] = { text = "S-LINE", color = "yellow" },
	["\19"] = { text = "S-BLOCK", color = "yellow" },
	["i"] = { text = "INSERT", color = "red" },
	["R"] = { text = "REPLACE", color = "red" },
	["c"] = { text = "COMMAND", color = "lavender" },
	["r"] = { text = "PROMPT", color = "lavender" },
	["!"] = { text = "SHELL", color = "lavender" },
	["t"] = { text = "TERMINAL", color = "lavender" },
}

M.init = function(self)
	self.mode = vim.fn.mode()
end

M.provider = function(self)
	return modes[self.mode].text
end

M.hl = function()
	return { fg = "mantle", bg = modes[vim.fn.mode()].color, bold = true }
end

-- wrap component with powerline symbols
M = utils.surround({ "", "" }, function()
	return modes[vim.fn.mode()].color
end, { M })

return M
