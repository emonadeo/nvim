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
					"clangd",
					"cssls",
					"denols",
					"emmet_language_server",
					"eslint",
					"jsonls",
					"gopls", -- go
					"lua_ls",
					"pyright", -- python
					"ruff_lsp", -- python checker/linter
					"rust_analyzer",
					"svelte",
					"volar", -- vue
					"wgsl_analyzer",
				},
				handlers = {
					lsp_zero.default_setup,
					denols = function()
						require("lspconfig").denols.setup({
							single_file_support = false,
							root_dir = function(startpath)
								local util = require("lspconfig.util")
								local deno_root = util.root_pattern("deno.json")(startpath)
								-- is there a deno.json?
								if not deno_root then
									-- no deno.json found -> disable denols
									return nil
								end
								-- found a deno.json
								local ts_root =
									util.root_pattern("tsconfig.json", "jsconfig.json", "package.json")(startpath)
								-- is there a tsconfig.json or package.json?
								if not ts_root then
									-- no tsconfig.json or package.json found -> enable denols
									return deno_root
								end
								if string.len(ts_root) > string.len(deno_root) then
									-- tsconfig.json or package.json is deeper than deno.json -> disable denols
									return nil
								end
								-- tsconfig.json or package.json is either the same or shallower than deno.json -> enable denols
								return deno_root
							end,
						})
					end,
					pyright = function()
						require("lspconfig").pyright.setup({
							settings = {
								pyright = {
									-- using ruff's import organizer
									disableOrganizeImports = true,
								},
								python = {
									analysis = {
										-- ignore all files for analysis to exclusively use ruff for linting
										ignore = { "*" },
									},
								},
							},
						})
					end,
					ruff_lsp = function()
						require("lspconfig").ruff_lsp.setup({
							on_init = function(client)
								client.server_capabilities.hoverProvider = false
							end,
						})
					end,
				},
			})
		end,
	},
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = function()
			return {
				single_file_support = false,
				-- only enable tsserver if the project has a `tsconfig.json `or` jsconfig.json`
				root_dir = function(startpath)
					local util = require("lspconfig.util")
					local ts_root = util.root_pattern("tsconfig.json", "jsconfig.json", "package.json")(startpath)
					-- is there a tsconfig.json or package.json?
					if not ts_root then
						-- no tsconfig.json or package.json found -> disable tsserver
						return nil
					end
					-- found a tsconfig.json or package.json
					local deno_root = util.root_pattern("deno.json")(startpath)
					-- is there a deno.json?
					if not deno_root then
						-- no deno.json found -> enable tsserver
						return ts_root
					end
					-- found a deno.json
					if string.len(ts_root) <= string.len(deno_root) then
						-- deno.json is either the same or deeper than tsconfig.json or package.json -> disable tsserver
						return nil
					end
					-- tsconfig.json or package.json is deeper than deno.json -> enable tsserver
					return ts_root
				end,
			}
		end,
	},
}
