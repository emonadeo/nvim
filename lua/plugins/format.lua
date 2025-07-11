return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = function()
		local util = require("conform.util")
		---@module "conform"
		---@type conform.setupOpts
		return {
			formatters = {
				["biome-check"] = {
					cwd = util.root_file({ "biome.json", "biome.jsonc" }),
					require_cwd = true,
				},
				deno_fmt = {
					cwd = util.root_file({ "deno.json", "deno.jsonc" }),
					require_cwd = true,
				},
				dprint = {
					cwd = util.root_file({ "dprint.json", "dprint.jsonc" }),
					require_cwd = true,
				},
				prettier = {
					cwd = util.root_file({
						"package.json",
						".prettierrc",
						".prettierrc.json",
						".prettierrc.yml",
						".prettierrc.yaml",
						".prettierrc.js",
						".prettierrc.mjs",
						".prettierrc.cjs",
						".prettierrc.toml",
						"prettier.config.js",
						"prettier.config.mjs",
						"prettier.config.cjs",
					}),
					require_cwd = true,
				},
				prettierd = {
					cwd = util.root_file({
						"package.json",
						".prettierrc",
						".prettierrc.json",
						".prettierrc.yml",
						".prettierrc.yaml",
						".prettierrc.js",
						".prettierrc.mjs",
						".prettierrc.cjs",
						".prettierrc.toml",
						"prettier.config.js",
						"prettier.config.mjs",
						"prettier.config.cjs",
					}),
					require_cwd = true,
				},
			},
			formatters_by_ft = {
				astro = {
					"dprint",
					"biome-check",
					"prettierd",
					"prettier",
					"deno_fmt",
					stop_after_first = true,
				},
				css = { "dprint", "prettierd", "prettier", "deno_fmt", stop_after_first = true },
				c = { "clang-format" },
				cpp = { "clang-format" },
				go = { "gofmt" },
				html = { "dprint", "prettierd", "prettier", "deno_fmt", stop_after_first = true },
				javascript = {
					"dprint",
					"biome-check",
					"prettierd",
					"prettier",
					"deno_fmt",
					stop_after_first = true,
				},
				javascriptreact = {
					"dprint",
					"biome-check",
					"prettierd",
					"prettier",
					"deno_fmt",
					stop_after_first = true,
				},
				json = {
					"dprint",
					"biome-check",
					"prettierd",
					"prettier",
					"deno_fmt",
					stop_after_first = true,
				},
				json5 = {
					"dprint",
					"biome-check",
					"prettierd",
					"prettier",
					"deno_fmt",
					stop_after_first = true,
				},
				jsonc = {
					"dprint",
					"biome-check",
					"prettierd",
					"prettier",
					"deno_fmt",
					stop_after_first = true,
				},
				lua = { "stylua" },
				markdown = {
					"dprint",
					"prettierd",
					"prettier",
					"deno_fmt",
					stop_after_first = true,
				},
				nix = { "nixfmt" },
				python = { "dprint", "ruff_format", stop_after_first = true },
				svg = { "dprint", "prettierd", "prettier", "deno_fmt", stop_after_first = true },
				toml = { "dprint", "rustfmt", stop_after_first = true },
				typescript = {
					"dprint",
					"biome-check",
					"prettierd",
					"prettier",
					"deno_fmt",
					stop_after_first = true,
				},
				typescriptreact = {
					"dprint",
					"biome-check",
					"prettierd",
					"prettier",
					"deno_fmt",
					stop_after_first = true,
				},
				yaml = { "dprint", "prettierd", "prettier", stop_after_first = true },
			},
			format_on_save = { timeout_ms = 500, lsp_fallback = true },
		}
	end,
	init = function() vim.o.formatexpr = "v:lua.require('conform').formatexpr()" end,
}
