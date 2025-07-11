return {
	"folke/trouble.nvim",
	dependencies = { "echasnovski/mini.icons", "folke/todo-comments.nvim" },
	opts = {
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
	},
	cmd = "Trouble",
	keys = {
		{
			"<leader>ed",
			desc = "Diagnostics",
			function()
				require("trouble").toggle({
					mode = "diagnostics",
					filter = { buf = 0 },
					focus = false,
					win = {
						position = "right",
					},
				})
			end,
		},
		{
			"<leader>eD",
			function()
				require("trouble").toggle({
					mode = "diagnostics",
					focus = false,
					win = {
						position = "right",
					},
				})
			end,
			desc = "All Diagnostics",
		},
		{
			"<leader>es",
			function()
				require("trouble").toggle({
					mode = "lsp_document_symbols",
					focus = false,
					win = {
						position = "right",
					},
				})
			end,
			desc = "LSP Symbols",
		},
		{
			"<leader>eS",
			function()
				require("trouble").toggle({
					mode = "lsp_workspace_symbols",
					focus = false,
					win = {
						position = "right",
					},
				})
			end,
			desc = "Symbols",
		},
		{
			"<leader>et",
			function()
				require("trouble").toggle({
					mode = "todo",
					filter = { buf = 0 },
					focus = false,
					win = {
						position = "right",
					},
				})
			end,
			desc = "Todos",
		},
		{
			"<leader>eT",
			function()
				require("trouble").toggle({
					mode = "todo",
					focus = false,
					win = {
						position = "right",
					},
				})
			end,
			desc = "All Todos",
		},
	},
}
