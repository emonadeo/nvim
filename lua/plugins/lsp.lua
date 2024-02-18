return {
	{
		"neovim/nvim-lspconfig",
		cmd = { "LspInfo", "LspInstall", "LspStart" },
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
		},
		config = function()
			local lsp_zero = require("lsp-zero")
			lsp_zero.set_server_config({
				capabilities = {
					textDocument = {
						foldingRange = {
							dynamicRegistration = false,
							lineFoldingOnly = true,
						},
					},
					workspace = {
						didChangeWatchedFiles = {
							dynamicRegistration = true,
						},
					},
				},
			})
			lsp_zero.extend_lspconfig()
			lsp_zero.on_attach(function(_, bufnr)
				lsp_zero.default_keymaps({ buffer = bufnr, preserve_mappings = false })
			end)

			require("mason").setup({})
			require("mason-lspconfig").setup({
				ensure_installed = {
					"astro",
					"eslint",
					"gopls", -- go
					"lua_ls",
					"prettier",
					"rust_analyzer",
					"svelte",
					"volar", -- vue
				},
				handlers = {
					lsp_zero.default_setup,
				},
			})
		end,
	},
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		config = true,
	},
}
