local M = {}

M.init = function(self)
	self.icon, self.icon_color = require("mini.icons").get("file", vim.api.nvim_buf_get_name(0))
end

M.provider = function(self)
	return self.icon and (self.icon .. " ")
end

M.hl = function(self)
	return self.icon_color
end

return M
