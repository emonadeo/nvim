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
				css = { "prettierd", "prettier", stop_after_first = true },
				c = { "clang-format" },
				cpp = { "clang-format" },
				html = { "prettierd", "prettier", stop_after_first = true },
				javascript = { "biome-check", "prettierd", "prettier", stop_after_first = true },
				javascriptreact = {
					"biome-check",
					"prettierd",
					"prettier",
					stop_after_first = true,
				},
				json = {
					"biome-check",
					"prettierd",
					"prettier",
					"deno_fmt",
					stop_after_first = true,
				},
				json5 = {
					"biome-check",
					"prettierd",
					"prettier",
					"deno_fmt",
					stop_after_first = true,
				},
				jsonc = {
					"biome-check",
					"prettierd",
					"prettier",
					"deno_fmt",
					stop_after_first = true,
				},
				lua = { "stylua" },
				markdown = { "prettierd", "prettier", stop_after_first = true },
				python = { "ruff_format" },
				svg = { "prettierd", "prettier", stop_after_first = true },
				toml = { "rustfmt" },
				typescript = {
					"biome-check",
					"prettierd",
					"prettier",
					"deno_fmt",
					stop_after_first = true,
				},
				typescriptreact = {
					"biome-check",
					"prettierd",
					"prettier",
					"deno_fmt",
					stop_after_first = true,
				},
				yaml = { "prettierd", "prettier", stop_after_first = true },
			},
			format_on_save = { timeout_ms = 500, lsp_fallback = true },
		}
	end,
	init = function() vim.o.formatexpr = "v:lua.require('conform').formatexpr()" end,
}
