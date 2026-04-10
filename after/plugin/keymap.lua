local files = require("mini.files")
local notify = require("notify")
local persistence = require("persistence")
local snacks = require("snacks")
local spider = require("spider")
local todos = require("todo-comments")
local trouble = require("trouble")
local which_key = require("which-key")

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Move by subwords and skip insignificant punctuation
vim.keymap.set({ "n", "o", "x" }, "w", function() spider.motion("w") end)
vim.keymap.set({ "n", "o", "x" }, "e", function() spider.motion("e") end)
vim.keymap.set({ "n", "o", "x" }, "b", function() spider.motion("b") end)
vim.keymap.set({ "n", "o", "x" }, "ge", function() spider.motion("ge") end)

-- ## Common actions
--------------------------------------------------------------------------------

vim.keymap.set("n", "<leader>q", vim.cmd.quit, { desc = "Quit" })
vim.keymap.set("n", "<leader>w", vim.cmd.write, { desc = "Write" })
vim.keymap.set("n", "<leader>/", function() which_key.show({ global = false }) end, { desc = "Local Keymap" })
vim.keymap.set("n", "<leader>?", function() which_key.show({ global = true }) end, { desc = "Global Keymap" })

-- ## LSP code actions `g` (except `ge`)
--------------------------------------------------------------------------------

-- TODO: Rework

vim.keymap.set("n", "gh", vim.diagnostic.open_float)

vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		local opts = { buffer = event.buf }
		vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "gs", function() vim.lsp.buf.signature_help() end, opts)
		vim.keymap.set("n", "g.", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "cd", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "x" }, "<F3>", vim.lsp.buf.format, opts)
	end,
})

-- ## Explore `e`
--------------------------------------------------------------------------------

-- ### Files

vim.keymap.set("n", "<leader>ee", function() files.open() end, { desc = "Current working directory" })
vim.keymap.set("n", "<leader>ef", function()
	files.open(vim.api.nvim_buf_get_name(0), false)
	files.reveal_cwd()
end, { desc = "Current file directory" })
vim.keymap.set("n", "<leader>ec", function() files.open(vim.fn.stdpath("config")) end, { desc = "Config directory" })
vim.keymap.set("n", "<leader>eh", function() files.open("~") end, { desc = "Home directory" })

-- ### Diagnostics

vim.keymap.set(
	"n",
	"<leader>ed",
	function()
		trouble.open({
			new = false,
			mode = "diagnostics",
			filter = { buf = 0 },
		})
	end,
	{
		desc = "Diagnostics",
	}
)

vim.keymap.set(
	"n",
	"<leader>eD",
	function() trouble.open({ new = false, mode = "diagnostics" }) end,
	{ desc = "All Diagnostics" }
)

-- ### LSP

vim.keymap.set(
	"n",
	"<leader>es",
	function() trouble.open({ new = false, mode = "lsp_document_symbols" }) end,
	{ desc = "LSP Symbols" }
)

-- ### Todos

vim.keymap.set(
	"n",
	"<leader>et",
	function() trouble.open({ new = false, mode = "todo", filter = { buf = 0 } }) end,
	{ desc = "Todos" }
)

vim.keymap.set("n", "<leader>eT", function() trouble.open({ new = false, mode = "todo" }) end, { desc = "All Todos" })

-- ## Find (Fuzzy Picker) `f`
--------------------------------------------------------------------------------

vim.keymap.set("n", "<leader>fb", function()
	files.close()
	snacks.picker.buffers()
end, { desc = "Buffers" })

vim.keymap.set("n", "<leader>ff", function()
	files.close()
	snacks.picker.files({
		hidden = true,
		exclude = { "target", "node_modules" },
	})
end, { desc = "Files" })

vim.keymap.set("n", "<leader>fF", function()
	files.close()
	snacks.picker.files({ hidden = true, ignored = true })
end, { desc = "Files (include hidden/ignored)" })

vim.keymap.set("n", "<leader>fg", function()
	files.close()
	snacks.picker.grep({
		hidden = true,
		exclude = { "target", "node_modules" },
	})
end, { desc = "Grep" })

vim.keymap.set("n", "<leader>fG", function()
	files.close()
	snacks.picker.grep({ hidden = true, ignored = true })
end, { desc = "Grep" })

vim.keymap.set("n", "<leader>fc", function()
	files.close()
	snacks.picker.colorschemes()
end, { desc = "Colorschemes" })

vim.keymap.set("n", "<leader>fd", function()
	files.close()
	snacks.picker.diagnostics_buffer()
end, { desc = "Diagnostics" })

vim.keymap.set("n", "<leader>fD", function()
	files.close()
	snacks.picker.diagnostics()
end, { desc = "All Diagnostics" })

vim.keymap.set("n", "<leader>fs", function()
	files.close()
	snacks.picker.lsp_symbols()
end, { desc = "LSP Symbols" })

vim.keymap.set("n", "<leader>fS", function()
	files.close()
	snacks.picker.lsp_workspace_symbols()
end, { desc = "All LSP Symbols" })

vim.keymap.set("n", "<leader>fr", function()
	files.close()
	snacks.picker.lsp_references()
end, { desc = "References", nowait = true })

vim.keymap.set("n", "<leader>ft", function()
	files.close()
	snacks.picker.todo_comments({
		filter = { buf = 0 },
	})
end, { desc = "Todos" })

vim.keymap.set("n", "<leader>fT", function()
	files.close()
	snacks.picker.todo_comments()
end, { desc = "All Todos" })

vim.keymap.set("n", "<leader>fn", function()
	files.close()
	snacks.picker.notifications()
end, { desc = "Notifications" })

-- TODO: Checkout undotree of neovim 0.12
vim.keymap.set("n", "<leader>fu", function()
	files.close()
	snacks.picker.undo()
end, { desc = "Todos" })

vim.keymap.set("n", "<leader>f.", function()
	files.close()
	snacks.picker.resume()
end, { desc = "Resume" })

-- ## Navigation `]`/`[`
--------------------------------------------------------------------------------

vim.keymap.set({ "n", "t" }, "]]", function() snacks.words.jump(vim.v.count1) end, { desc = "Next Reference" })
vim.keymap.set({ "n", "t" }, "[[", function() snacks.words.jump(-vim.v.count1) end, { desc = "Previous Reference" })
vim.keymap.set("n", "]t", todos.jump_next, { desc = "Next todo" })
vim.keymap.set("n", "[t", todos.jump_prev, { desc = "Previous todo" })

-- ## Other
--------------------------------------------------------------------------------

-- TODO: Organize

vim.keymap.set("n", "<leader>qs", persistence.load, { desc = "Load session of current directory" })
vim.keymap.set("n", "<leader>qS", persistence.select, { desc = "Select session" })
vim.keymap.set("n", "<leader>qd", persistence.stop, { desc = "Stop persistence" })
vim.keymap.set("n", "<leader>ql", function() persistence.load({ last = true }) end, { desc = "Load last session" })

vim.keymap.set(
	"n",
	"<leader>un",
	function() notify.dismiss({ silent = true, pending = true }) end,
	{ desc = "Dismiss all Notifications" }
)
