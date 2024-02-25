local M = {}

M.init = function(self)
	self.file_name = vim.api.nvim_buf_get_name(0)
end

M.provider = function(self)
	-- trim file name relative to the current directory
	local file_name = vim.fn.fnamemodify(self.file_name, ":.")
	if file_name == "" then
		return "[No Name]"
	end
	return file_name
end

return M
