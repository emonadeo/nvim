return {
	"echasnovski/mini.files",
	lazy = false,
	version = false,
	dependencies = { "echasnovski/mini.icons" },
	opts = {
		mappings = {
			go_in = "", -- unset default
			go_in_plus = "L",
			go_out = "", -- unset default
			go_out_plus = "H",
		},
		windows = {
			preview = true,
			width_focus = 30,
			width_nofocus = 15,
			width_preview = 60,
		},
	},
	keys = {
		{
			"<leader>e",
			function()
				local mini_files = require("mini.files")
				mini_files.open(vim.api.nvim_buf_get_name(0), false)
				mini_files.reveal_cwd()
			end,
			desc = "Open File Explorer",
		},
	},
	init = function()
		-- Add default bookmarks
		vim.api.nvim_create_autocmd("User", {
			pattern = "MiniFilesExplorerOpen",
			callback = function()
				local mini_files = require("mini.files")
				mini_files.set_bookmark("c", vim.fn.stdpath("config"), { desc = "Config" })
				mini_files.set_bookmark("w", vim.fn.getcwd, { desc = "Working directory" })
				mini_files.set_bookmark("~", "~", { desc = "Home directory" })
			end,
		})

		-- Extra key bindings
		vim.api.nvim_create_autocmd("User", {
			pattern = "MiniFilesBufferCreate",
			callback = function(args)
				-- `g~` set current working directory to selected entry
				vim.keymap.set("n", "g~", function()
					local current_entry_path = require("mini.files").get_fs_entry().path
					local current_directory = vim.fs.dirname(current_entry_path)
					vim.fn.chdir(current_directory)
				end, {
					buffer = args.data.buf_id,
					desc = "Set working directory",
				})
			end,
		})
	end,
}