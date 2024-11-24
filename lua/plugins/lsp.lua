return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lsp = require("lspconfig")
		-- Gleam
		lsp.gleam.setup({})
		-- Lua
		lsp.lua_ls.setup({})
		-- Rust
		lsp.rust_analyzer.setup({})
		-- TypeScript
		lsp.vtsls.setup({})

		-- Rounded borders
		vim.lsp.handlers["textDocument/hover"] =
			vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
		vim.lsp.handlers["textDocument/signatureHelp"] =
			vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
		vim.diagnostic.config({
			float = { border = "rounded" },
			signs = true,
		})
	end,
}
