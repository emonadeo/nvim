local trouble = require("trouble")

trouble.setup({
	focus = true,
	warn_no_results = false,
	open_no_results = true,
	---@type trouble.Window.opts
	win = { position = "right", relative = "win" },
	-- `file_icon` has a hardcoded space in it.
	-- https://github.com/folke/trouble.nvim/blob/v3.6.0/lua/trouble/format.lua#L115-L121
	modes = {
		diagnostics = {
			groups = {
				{ "filename", format = "{file_icon}{basename} {count}" },
			},
		},
		todo = {
			groups = {
				{ "filename", format = "{file_icon}{filename} {count}" },
			},
		},
		lsp_base = {
			groups = {
				{ "filename", format = "{file_icon}{filename} {count}" },
			},
		},
		lsp_document_symbols = {
			filter = {
				["not"] = { ft = "rust", kind = "Variable" },
			},
			groups = {
				{ "filename", format = "{file_icon}{filename} {count}" },
			},
		},
	},
	icons = {
		---@type trouble.Indent.symbols
		indent = {
			top = "│ ",
			middle = "├╴",
			last = "└╴",
			fold_open = " ",
			fold_closed = " ",
			ws = "  ",
		},
		folder_closed = "",
		folder_open = "",
		kinds = {
			Array = "",
			Boolean = "󰨙",
			Class = "󰠱",
			Constant = "󰏿",
			Constructor = "",
			Enum = "󱡠",
			EnumMember = "󱡠",
			Event = "",
			Field = "",
			File = "",
			Function = "󰊕",
			Interface = "",
			Key = "󰻾",
			Method = "󰊕",
			Module = "",
			Namespace = "󰦮",
			Null = "",
			Number = "󰎠",
			Object = "",
			Operator = "󰆕",
			Package = "",
			Property = "",
			String = "",
			Struct = "󰙅",
			TypeParameter = "",
			Variable = "",
		},
	},
})

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
	local trouble = require("trouble")
	if not trouble.is_open({ mode = "todo" }) then trouble.close() end
	trouble.open({
		new = false,
		mode = "todo",
		filter = { buf = 0 },
	})
end, { desc = "Todos" })

vim.keymap.set("n", "<leader>eT", function()
	local trouble = require("trouble")
	if not trouble.is_open({ mode = "todo" }) then trouble.close() end
	trouble.open({
		new = false,
		mode = "todo",
	})
end, { desc = "All Todos" })
