return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		opts = function()
			return {
				formatters_by_ft = {
					css = { { "prettierd", "prettier" } },
					html = { { "prettierd", "prettier" } },
					javascript = { { "prettierd", "prettier" } },
					javascriptreact = { { "prettierd", "prettier" } },
					json = { { "prettierd", "prettier" } },
					lua = { "stylua" },
					markdown = { { "prettierd", "prettier" } },
					svg = { { "prettierd", "prettier" } },
					toml = { "rustfmt" },
					typescript = { { "prettierd", "prettier" } },
					typescriptreact = { { "prettierd", "prettier" } },
				},
				-- Set up format-on-save
				format_on_save = { timeout_ms = 500, lsp_fallback = true },
				formatters = {
					prettier = {
						cwd = require("conform.util").root_file({ "package.json", ".prettierrc.json" }),
						require_cwd = true,
					},
					prettierd = {
						cwd = require("conform.util").root_file({ "package.json", ".prettierrc.json" }),
						require_cwd = true,
					},
				},
			}
		end,
	},
}
