local snacks = require("snacks")

snacks.setup(
	---@module "snacks"
	---@type snacks.Config
	{
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
	}
)

-- Words
vim.keymap.set(
	{ "n", "t" },
	"]]",
	function() snacks.words.jump(vim.v.count1) end,
	{ desc = "Next Reference" }
)
vim.keymap.set(
	{ "n", "t" },
	"[[",
	function() snacks.words.jump(-vim.v.count1) end,
	{ desc = "Previous Reference" }
)

-- Picker
vim.keymap.set("n", "<leader>fb", function() snacks.picker.buffers() end, { desc = "Buffers" })
vim.keymap.set(
	"n",
	"<leader>ff",
	function()
		snacks.picker.files({
			hidden = true,
			exclude = { "target", "node_modules" },
		})
	end,
	{ desc = "Files" }
)
vim.keymap.set(
	"n",
	"<leader>fF",
	function() snacks.picker.files({ hidden = true, ignored = true }) end,
	{ desc = "Files" }
)
vim.keymap.set(
	"n",
	"<leader>fg",
	function()
		snacks.picker.grep({
			hidden = true,
			exclude = { "target", "node_modules" },
		})
	end,
	{ desc = "Grep" }
)
vim.keymap.set(
	"n",
	"<leader>fG",
	function() snacks.picker.grep({ hidden = true, ignored = true }) end,
	{ desc = "Grep" }
)
vim.keymap.set(
	"n",
	"<leader>fc",
	function() snacks.picker.colorschemes() end,
	{ desc = "Colorschemes" }
)
vim.keymap.set(
	"n",
	"<leader>fd",
	function() snacks.picker.diagnostics_buffer() end,
	{ desc = "Diagnostics" }
)
vim.keymap.set(
	"n",
	"<leader>fD",
	function() snacks.picker.diagnostics() end,
	{ desc = "All Diagnostics" }
)
vim.keymap.set(
	"n",
	"<leader>fs",
	function() snacks.picker.lsp_symbols() end,
	{ desc = "LSP Symbols" }
)
vim.keymap.set(
	"n",
	"<leader>fS",
	function() snacks.picker.lsp_workspace_symbols() end,
	{ desc = "All LSP Symbols" }
)
vim.keymap.set(
	"n",
	"<leader>fr",
	function() snacks.picker.lsp_references() end,
	{ desc = "References", nowait = true }
)
vim.keymap.set(
	"n",
	"<leader>ft",
	function()
		snacks.picker.todo_comments({

			filter = { buf = 0 },
		})
	end,
	{ desc = "Todos" }
)
vim.keymap.set(
	"n",
	"<leader>fT",
	function() snacks.picker.todo_comments() end,
	{ desc = "All Todos" }
)
vim.keymap.set(
	"n",
	"<leader>fn",
	function() snacks.picker.notifications() end,
	{ desc = "Notifications" }
)
vim.keymap.set("n", "<leader>fu", function() snacks.picker.undo() end, { desc = "Todos" })
vim.keymap.set("n", "<leader>f.", function() snacks.picker.resume() end, { desc = "Resume" })

-- also set keys after loading ftplugins, since a lot overwrite `[[` and `]]`
vim.api.nvim_create_autocmd("FileType", {
	callback = function()
		local buffer = vim.api.nvim_get_current_buf()
		vim.keymap.set(
			"n",
			"]]",
			function() snacks.words.jump(vim.v.count1) end,
			{ desc = "Next Reference", buffer = buffer }
		)
		vim.keymap.set(
			"n",
			"[[",
			function() snacks.words.jump(-vim.v.count1) end,
			{ desc = "Previous Reference", buffer = buffer }
		)
	end,
})
