-- TODO: Keymap
return {
	{
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp" },
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			local lsp = require("lspconfig")
			local util = require("lspconfig.util")

			-- Astro `npm:@astrojs/language-server`
			lsp.astro.setup({
				capabilities = capabilities,
			})

			-- Biome `npm:@biomejs/biome`
			lsp.biome.setup({
				capabilities = capabilities,
			})

			-- C `brew:llvm`
			lsp.clangd.setup({
				capabilities = capabilities,
				cmd = {
					"clangd",
					"--offset-encoding=utf-16",
				},
			})

			-- CSS `npm:vscode-langservers-extracted`
			lsp.cssls.setup({
				capabilities = capabilities,
			})

			-- Deno `brew:deno`
			lsp.denols.setup({
				capabilities = capabilities,
				single_file_support = false,
				root_dir = function(startpath)
					local deno_root = util.root_pattern("deno.json", "deno.jsonc")(startpath)
					-- is there a deno.json?
					if not deno_root then
						-- no deno.json found -> disable denols
						return nil
					end
					-- found a deno.json
					local ts_root =
						util.root_pattern("tsconfig.json", "jsconfig.json", "package.json")(
							startpath
						)
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

			-- Docker `npm:dockerfile-language-server-nodejs`
			lsp.dockerls.setup({
				capabilities = capabilities,
				root_dir = util.root_pattern(
					"containerfile",
					"Containerfile",
					"dockerfile",
					"Dockerfile"
				),
			})

			-- Emmet `npm:@olrtg/emmet-language-server`
			lsp.emmet_language_server.setup({
				capabilities = capabilities,
			})

			-- Gleam `brew:gleam`
			lsp.gleam.setup({
				capabilities = capabilities,
			})

			-- Go `brew:go`
			lsp.gopls.setup({
				capabilities = capabilities,
			})

			-- HTML `npm:vscode-langservers-extracted`
			lsp.html.setup({
				capabilities = capabilities,
			})

			-- JSON `npm:vscode-langservers-extracted`
			lsp.jsonls.setup({
				capabilities = capabilities,
				init_options = {
					provideFormatter = false,
				},
			})

			-- Lua `brew:lua-language-server`
			lsp.lua_ls.setup({
				capabilities = capabilities,
			})

			-- Nix `nil`
			lsp.nil_ls.setup({
				capabilities = capabilities,
			})

			-- Nushell `nushell`
			lsp.nushell.setup({
				capabilities = capabilities,
			})

			-- Python `npm:pyright`
			lsp.pyright.setup({
				capabilities = capabilities,
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

			-- Python (Linter/Formatter) `brew:ruff`
			lsp.ruff.setup({
				capabilities = capabilities,
				on_init = function(client) client.server_capabilities.hoverProvider = false end,
			})

			-- Rust `brew:rust-analyzer`
			lsp.rust_analyzer.setup({
				capabilities = capabilities,
			})

			-- TOML `brew:taplo`
			lsp.taplo.setup({
				capabilities = capabilities,
			})

			-- TypeScript `npm:@vtsls/language-server`
			lsp.vtsls.setup({
				capabilities = capabilities,
				single_file_support = false,
				root_dir = function(startpath)
					local ts_root =
						util.root_pattern("tsconfig.json", "jsconfig.json", "package.json")(
							startpath
						)
					if not ts_root then return nil end
					local deno_root = util.root_pattern("deno.json", "deno.jsonc")(startpath)
					if not deno_root then return ts_root end
					if string.len(deno_root) >= string.len(ts_root) then return nil end
					return ts_root
				end,
			})

			-- WSGL `cargo install --git https://github.com/wgsl-analyzer/wgsl-analyzer wgsl_analyzer`
			lsp.wgsl_analyzer.setup({
				capabilities = capabilities,
			})

			-- Rounded borders
			vim.diagnostic.config({
				float = { border = "rounded" },
				signs = true,
			})
		end,
		init = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				desc = "LSP actions",
				callback = function(event)
					local opts = { buffer = event.buf }
					local float_opts = { border = "rounded" }
					vim.keymap.set("n", "K", function() vim.lsp.buf.hover(float_opts) end, opts)
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
					vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set(
						"n",
						"gs",
						function() vim.lsp.buf.signature_help(float_opts) end,
						opts
					)
					vim.keymap.set("n", "g.", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
					vim.keymap.set("n", "cd", vim.lsp.buf.rename, opts)
					vim.keymap.set({ "n", "x" }, "<F3>", vim.lsp.buf.format, opts)
				end,
			})
		end,
	},

	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
}
