return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		opts = function()
			return {
				formatters = {
					prettier = {
						cwd = require("conform.util").root_file({
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
						cwd = require("conform.util").root_file({
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
					deno_fmt = {
						cwd = require("conform.util").root_file({ "deno.json" }),
					},
				},
				formatters_by_ft = {
					css = { { "prettierd", "prettier" } },
					html = { { "prettierd", "prettier" } },
					javascript = { { "prettierd", "prettier" } },
					javascriptreact = { { "prettierd", "prettier" } },
					json = { { "prettierd", "prettier", "deno_fmt" } },
					lua = { "stylua" },
					markdown = { { "prettierd", "prettier" } },
					python = { "ruff_format" },
					svg = { { "prettierd", "prettier" } },
					toml = { "rustfmt" },
					typescript = { { "prettierd", "prettier" } },
					typescriptreact = { { "prettierd", "prettier" } },
					yaml = { { "prettierd", "prettier" } },
				},
				format_on_save = { timeout_ms = 500, lsp_fallback = true },
			}
		end,
	},
}
