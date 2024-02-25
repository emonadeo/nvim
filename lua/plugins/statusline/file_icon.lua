local M = {}

M.init = function(self)
	local file_name = vim.api.nvim_buf_get_name(0)
	local extension = vim.fn.fnamemodify(file_name, ":e")
	self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(file_name, extension, { default = true })
end

M.provider = function(self)
	return self.icon and (self.icon .. " ")
end

M.hl = function(self)
	return { fg = self.icon_color }
end

return M
