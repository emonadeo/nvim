return {
	"jose-elias-alvarez/null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "mason.nvim" },
	opts = function()
		local null_ls = require("null-ls")
		return {
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ bufnr = bufnr })
						end,
					})
				end
			end,
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.latexindent,
				null_ls.builtins.formatting.packer.with({
					runtime_condition = function()
						return true
					end,
				}),
				null_ls.builtins.formatting.prettier.with({
					extra_filetypes = { "sql", "astro" },
				}),
				-- null_ls.builtins.formatting.deno_fmt,
			},
		}
	end,
}
