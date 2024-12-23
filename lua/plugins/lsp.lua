local setup_keymap = function()
	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(event)
			local map = function(mode, key, desc, fn)
				vim.keymap.set(mode, key, fn, {
					buffer = event.buf,
					desc = desc,
					nowait = true,
				})
			end

			map("n", "gd", "Go to Definition", vim.lsp.buf.definition)
			map("n", "gD", "Go to Declaration", vim.lsp.buf.declaration)
			map("n", "gi", "Go to Implementation", vim.lsp.buf.implementation)
			map("n", "go", "Go to Type definition", vim.lsp.buf.type_definition)
			map("n", "gr", "Go to Reference", vim.lsp.buf.references)
			map("n", "gl", "Line Diagnostics", vim.diagnostic.open_float)
			map("n", "gK", "Show Function Signature", vim.lsp.buf.signature_help)
			map("i", "<C-k>", "Show Function Signature", vim.lsp.buf.signature_help)
			map("n", "g.", "Show Code Actions", vim.lsp.buf.code_action)
			map("n", "<F2>", "Rename Symbol", vim.lsp.buf.rename)
			map("n", "<F3>", "Format File", function()
				vim.lsp.buf.format({ async = true })
			end)
			map("x", "<F3>", "Format Selection", function()
				vim.lsp.buf.format({ async = true })
			end)
		end,
	})
end

local setup_ui = function()
	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

	vim.lsp.handlers["textDocument/signatureHelp"] =
		vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

	vim.diagnostic.config({
		float = { border = "rounded" },
		signs = true,
	})
end

return {
	{
		"neovim/nvim-lspconfig",
		cmd = { "LspInfo", "LspInstall", "LspStart" },
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "folke/neoconf.nvim" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
		},
		config = function()
			setup_ui()
			setup_keymap()
			require("neoconf").setup({})
			require("mason").setup({})
			local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
			require("lspconfig").gleam.setup({})
			require("mason-lspconfig").setup({
				ensure_installed = {
					"astro",
					"biome",
					"clangd",
					"cssls",
					"denols",
					"docker_compose_language_service",
					"dockerls",
					"emmet_language_server",
					"eslint",
					"gopls", -- go
					"jsonls",
					"lua_ls",
					"pyright", -- python
					"ruff", -- python checker/linter
					"svelte",
					"volar", -- vue
					"wgsl_analyzer",
				},
				handlers = {
					function(server)
						require("lspconfig")[server].setup({
							capabilities = lsp_capabilities,
						})
					end,
					clangd = function()
						require("lspconfig").clangd.setup({
							cmd = {
								"clangd",
								"--offset-encoding=utf-16",
							},
						})
					end,
					denols = function()
						require("lspconfig").denols.setup({
							single_file_support = false,
							root_dir = function(startpath)
								local util = require("lspconfig.util")
								local deno_root = util.root_pattern("deno.json", "deno.jsonc")(startpath)
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
					dockerls = function()
						local util = require("lspconfig.util")
						require("lspconfig").dockerls.setup({
							root_dir = util.root_pattern("containerfile", "Containerfile", "dockerfile", "Dockerfile"),
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
					ruff = function()
						require("lspconfig").ruff.setup({
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
					local deno_root = util.root_pattern("deno.json", "deno.jsonc")(startpath)
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
