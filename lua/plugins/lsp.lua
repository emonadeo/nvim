return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		lazy = true,
		config = false,
	},

	{
		"neovim/nvim-lspconfig",
		cmd = { "LspInfo", "LspInstall", "LspStart" },
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
		},
		config = function()
			local lsp_zero = require("lsp-zero")
			lsp_zero.set_server_config({
				capabilities = {
					workspace = {
						didChangeWatchedFiles = {
							dynamicRegistration = true,
						},
					},
				},
			})
			lsp_zero.extend_lspconfig()
			lsp_zero.on_attach(function(client, bufnr)
				-- see :help lsp-zero-keybindings
				lsp_zero.default_keymaps({
					buffer = bufnr,
					preserve_mappings = false,
				})
				-- enable format on save
				lsp_zero.buffer_autoformat()
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
					"tsserver", -- typescript
					"volar", -- vue
				},
				handlers = {
					lsp_zero.default_setup,
				},
			})
		end,
	},

	{
		"nvimtools/none-ls.nvim",
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
				},
			})
		end,
	},

	-- json schemas
	-- TODO: connect to jsonls
	{
		"b0o/SchemaStore.nvim",
		version = false, -- last release is way too old
	},
}
