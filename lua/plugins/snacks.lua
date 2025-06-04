return {
	"folke/snacks.nvim",
	dependencies = { "folke/todo-comments.nvim" },
	priority = 1000,
	lazy = false,
	---@module "snacks"
	---@type snacks.Config
	opts = {
		indent = { enabled = true },
		picker = { enabled = true },
		rename = { enabled = true },
		words = { enabled = true },
		statuscolumn = {
			enabled = true,
			left = { "mark", "sign" },
			right = { "fold", "git" },
			folds = {
				open = false, -- show open fold icons
				git_hl = true, -- use Git Signs hl for fold icons
			},
			git = {
				-- patterns to match Git signs
				patterns = { "MiniDiffSign" },
			},
		},
	},
	keys = {
		-- Words
		{
			"]]",
			function() require("snacks").words.jump(vim.v.count1) end,
			desc = "Next Reference",
			mode = { "n", "t" },
		},
		{
			"[[",
			function() require("snacks").words.jump(-vim.v.count1) end,
			desc = "Previous Reference",
			mode = { "n", "t" },
		},
		-- Picker
		{ "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
		{ "<leader>ff", function() Snacks.picker.files() end, desc = "Files" },
		{ "<leader>fg", function() Snacks.picker.grep() end, desc = "Grep" },
		{ "<leader>fc", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
		{ "<leader>fd", function() Snacks.picker.diagnostics_buffer() end, desc = "Diagnostics" },
		{ "<leader>fD", function() Snacks.picker.diagnostics() end, desc = "All Diagnostics" },
		{
			"<leader>fs",
			function() Snacks.picker.lsp_symbols() end,
			desc = "LSP Symbols",
		},
		{
			"<leader>fS",
			function() Snacks.picker.lsp_workspace_symbols() end,
			desc = "All LSP Symbols",
		},
		{
			"<leader>fr",
			function() Snacks.picker.lsp_references() end,
			nowait = true,
			desc = "References",
		},
		{
			"<leader>ft",
			function()
				Snacks.picker.todo_comments({

					filter = { buf = 0 },
				})
			end,
			desc = "Todos",
		},
		{ "<leader>fT", function() Snacks.picker.todo_comments() end, desc = "All Todos" },
		{ "<leader>fn", function() Snacks.picker.notifications() end, desc = "Notifications" },
		{ "<leader>fu", function() Snacks.picker.undo() end, desc = "Todos" },
		{ "<leader>f.", function() Snacks.picker.resume() end, desc = "Resume" },
	},
	init = function()
		-- also set keys after loading ftplugins, since a lot overwrite `[[` and `]]`
		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				local buffer = vim.api.nvim_get_current_buf()
				vim.keymap.set(
					"n",
					"]]",
					function() require("snacks").words.jump(vim.v.count1) end,
					{ desc = "Next Reference", buffer = buffer }
				)
				vim.keymap.set(
					"n",
					"[[",
					function() require("snacks").words.jump(-vim.v.count1) end,
					{ desc = "Previous Reference", buffer = buffer }
				)
			end,
		})
	end,
}
