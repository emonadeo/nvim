local files = require("mini.files")

files.setup({
	mappings = {
		go_in = "", -- unset default
		go_in_plus = "L",
		go_out = "", -- unset default
		go_out_plus = "H",
	},
})

vim.api.nvim_create_autocmd("User", {
	pattern = "MiniFilesBufferCreate",
	callback = function(args)
		local buf_id = args.data.buf_id
		vim.keymap.set("n", "<CR>", function() files.go_in({ close_on_file = true }) end, { buffer = buf_id })
	end,
})
