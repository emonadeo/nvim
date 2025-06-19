-- TODO: Keymap
return {
	{
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp" },
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			local util = require("lspconfig.util")

			-- Astro `npm:@astrojs/language-server`
			vim.lsp.enable("astro")
			vim.lsp.config("astro", {
				capabilities = capabilities,
			})

			-- Biome `npm:@biomejs/biome`
			vim.lsp.enable("biome")
			vim.lsp.config("biome", {
				capabilities = capabilities,
			})

			-- C `brew:llvm`
			vim.lsp.enable("clangd")
			vim.lsp.config("clangd", {
				capabilities = capabilities,
				cmd = {
					"clangd",
					"--offset-encoding=utf-16",
				},
			})

			-- ESLint `npm:vscode-langservers-extracted`
			vim.lsp.enable("eslint")
			vim.lsp.config("eslint", {
				capabilities = capabilities,
			})

			-- CSS `npm:vscode-langservers-extracted`
			vim.lsp.enable("cssls")
			vim.lsp.config("cssls", {
				capabilities = capabilities,
			})

			-- Deno `brew:deno`
			vim.lsp.enable("denols")
			vim.lsp.config("denols", {
				capabilities = capabilities,
				workspace_required = true,
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
			vim.lsp.enable("dockerls")
			vim.lsp.config("dockerls", {
				capabilities = capabilities,
				root_dir = util.root_pattern(
					"containerfile",
					"Containerfile",
					"dockerfile",
					"Dockerfile"
				),
			})

			-- Emmet `npm:@olrtg/emmet-language-server`
			vim.lsp.enable("emmet_language_server")
			vim.lsp.config("emmet_language_server", {
				capabilities = capabilities,
			})

			-- Gleam `brew:gleam`
			vim.lsp.enable("gleam")
			vim.lsp.config("gleam", {
				capabilities = capabilities,
			})

			-- Go `brew:go`
			vim.lsp.enable("gopls")
			vim.lsp.config("gopls", {
				capabilities = capabilities,
			})

			-- HTML `npm:vscode-langservers-extracted`
			vim.lsp.enable("html")
			vim.lsp.config("html", {
				capabilities = capabilities,
			})

			-- JSON `npm:vscode-langservers-extracted`
			vim.lsp.enable("jsonls")
			vim.lsp.config("jsonls", {
				capabilities = capabilities,
				init_options = {
					provideFormatter = false,
				},
			})

			-- Lua `brew:lua-language-server`
			vim.lsp.enable("lua_ls")
			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
			})

			-- Nix `nil`
			vim.lsp.enable("nil_ls")
			vim.lsp.config("nil_ls", {
				capabilities = capabilities,
			})

			-- Nushell `nushell`
			vim.lsp.enable("nushell")
			vim.lsp.config("nushell", {
				capabilities = capabilities,
			})

			-- Python `npm:pyright`
			vim.lsp.enable("pyright")
			vim.lsp.config("pyright", {
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
			vim.lsp.enable("ruff")
			vim.lsp.config("ruff", {
				capabilities = capabilities,
				on_init = function(client) client.server_capabilities.hoverProvider = false end,
			})

			-- Rust `brew:rust-analyzer`
			vim.lsp.enable("rust_analyzer")
			vim.lsp.config("rust_analyzer", {
				capabilities = capabilities,
				settings = {
					["rust-analyzer"] = {
						cargo = {
							features = "all",
						},
					},
				},
			})

			-- TOML `brew:taplo`
			vim.lsp.enable("taplo")
			vim.lsp.config("taplo", {
				capabilities = capabilities,
			})

			-- TypeScript `npm:@vtsls/language-server`
			vim.lsp.enable("vtsls")
			vim.lsp.config("vtsls", {
				capabilities = capabilities,
				workspace_required = true,
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
			vim.lsp.enable("wgsl_analyzer")
			vim.lsp.config("wgsl_analyzer", {
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
