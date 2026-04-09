-- TODO:
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("n", "<leader>w", vim.cmd.write, { desc = "Write" })
local oil = require("oil")

-- vim.keymap.set("n", "<leader>ee", function() oil.open() end, { desc = "Current working directory" })
vim.keymap.set("n", "<leader>ef", function() oil.open() end, { desc = "File directory" })
vim.keymap.set("n", "<leader>ec", function() oil.open(vim.fn.stdpath("config")) end, { desc = "Config directory" })

-- Snacks
local snacks = require("snacks")

-- Words
vim.keymap.set({ "n", "t" }, "]]", function() snacks.words.jump(vim.v.count1) end, { desc = "Next Reference" })
vim.keymap.set({ "n", "t" }, "[[", function() snacks.words.jump(-vim.v.count1) end, { desc = "Previous Reference" })

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
vim.keymap.set("n", "<leader>fc", function() snacks.picker.colorschemes() end, { desc = "Colorschemes" })
vim.keymap.set("n", "<leader>fd", function() snacks.picker.diagnostics_buffer() end, { desc = "Diagnostics" })
vim.keymap.set("n", "<leader>fD", function() snacks.picker.diagnostics() end, { desc = "All Diagnostics" })
vim.keymap.set("n", "<leader>fs", function() snacks.picker.lsp_symbols() end, { desc = "LSP Symbols" })
vim.keymap.set("n", "<leader>fS", function() snacks.picker.lsp_workspace_symbols() end, { desc = "All LSP Symbols" })
vim.keymap.set("n", "<leader>fr", function() snacks.picker.lsp_references() end, { desc = "References", nowait = true })
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
vim.keymap.set("n", "<leader>fT", function() snacks.picker.todo_comments() end, { desc = "All Todos" })
vim.keymap.set("n", "<leader>fn", function() snacks.picker.notifications() end, { desc = "Notifications" })
vim.keymap.set("n", "<leader>fu", function() snacks.picker.undo() end, { desc = "Todos" })
vim.keymap.set("n", "<leader>f.", function() snacks.picker.resume() end, { desc = "Resume" })

local which_key = require("which-key")
vim.keymap.set("n", "<leader>?", function() which_key.show({ global = false }) end, { desc = "Local Keymap" })

local trouble = require("trouble")
vim.keymap.set("n", "<leader>ed", function()
	if not trouble.is_open({ mode = "diagnostics" }) then trouble.close() end
	trouble.open({
		new = false,
		mode = "diagnostics",
		filter = { buf = 0 },
	})
end, {
	desc = "Diagnostics",
})

vim.keymap.set("n", "<leader>eD", function()
	if not trouble.is_open({ mode = "diagnostics" }) then trouble.close() end
	trouble.open({
		new = false,
		mode = "diagnostics",
	})
end, { desc = "All Diagnostics" })

vim.keymap.set("n", "<leader>es", function()
	if not trouble.is_open({ mode = "lsp_document_symbols" }) then trouble.close() end
	trouble.open({
		new = false,
		mode = "lsp_document_symbols",
	})
end, { desc = "LSP Symbols" })

vim.keymap.set("n", "<leader>et", function()
	if not trouble.is_open({ mode = "todo" }) then trouble.close() end
	trouble.open({
		new = false,
		mode = "todo",
		filter = { buf = 0 },
	})
end, { desc = "Todos" })

vim.keymap.set("n", "<leader>eT", function()
	if not trouble.is_open({ mode = "todo" }) then trouble.close() end
	trouble.open({
		new = false,
		mode = "todo",
	})
end, { desc = "All Todos" })

local persistence = require("persistence")
vim.keymap.set("n", "<leader>qs", persistence.load, { desc = "Load session of current directory" })
vim.keymap.set("n", "<leader>qS", persistence.select, { desc = "Select session" })
vim.keymap.set("n", "<leader>qd", persistence.stop, { desc = "Stop persistence" })
vim.keymap.set("n", "<leader>ql", function() persistence.load({ last = true }) end, { desc = "Load last session" })

vim.keymap.set(
	"n",
	"<leader>un",
	function() vim.notify.dismiss({ silent = true, pending = true }) end,
	{ desc = "Dismiss all Notifications" }
)

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

local todos = require("todo-comments")
vim.keymap.set("n", "]t", todos.jump_next, { desc = "Next todo" })
vim.keymap.set("n", "[t", todos.jump_prev, { desc = "Previous todo" })
