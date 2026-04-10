require("trouble").setup({
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
