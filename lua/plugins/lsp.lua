return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lsp = require("lspconfig")
		local util = require("lspconfig.util")

		-- Astro `npm:@astrojs/language-server`
		lsp.astro.setup({})

		-- Biome `npm:@biomejs/biome`
		lsp.biome.setup({})

		-- C `brew:llvm`
		lsp.clangd.setup({
			cmd = {
				"clangd",
				"--offset-encoding=utf-16",
			},
		})

		-- CSS `npm:vscode-langservers-extracted`
		lsp.cssls.setup({})

		-- Deno `brew:deno`
		lsp.denols.setup({
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

		-- Docker `npm:dockerfile-language-server-nodejs`
		lsp.dockerls.setup({
			root_dir = util.root_pattern(
				"containerfile",
				"Containerfile",
				"dockerfile",
				"Dockerfile"
			),
		})

		-- Emmet `npm:@olrtg/emmet-language-server`
		lsp.emmet_language_server.setup({})

		-- Gleam `brew:gleam`
		lsp.gleam.setup({})

		-- Go `brew:go`
		lsp.gopls.setup({})

		-- HTML `npm:vscode-langservers-extracted`
		lsp.html.setup({})

		-- JSON `npm:vscode-langservers-extracted`
		lsp.jsonls.setup({
			init_options = {
				provideFormatter = false,
			},
		})

		-- Lua `brew:lua-language-server`
		lsp.lua_ls.setup({})

		-- Python `npm:pyright`
		lsp.pyright.setup({
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
			on_init = function(client) client.server_capabilities.hoverProvider = false end,
		})

		-- Rust `brew:rust-analyzer`
		lsp.rust_analyzer.setup({})

		-- TypeScript `npm:@vtsls/language-server`
		lsp.vtsls.setup({})

		-- WSGL `cargo install --git https://github.com/wgsl-analyzer/wgsl-analyzer wgsl_analyzer`
		lsp.wgsl_analyzer.setup({})

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
