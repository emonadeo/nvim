return {
	"jose-elias-alvarez/null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "mason.nvim" },
	opts = function()
		local null_ls = require("null-ls")
		return {
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.latexindent,
				null_ls.builtins.formatting.packer.with({
					runtime_condition = function()
						return true
					end,
				}),
				null_ls.builtins.formatting.prettier.with({
					extra_filetypes = { "sql", "astro", "svg" },
				}),
				-- null_ls.builtins.formatting.deno_fmt,
				null_ls.builtins.formatting.black,
			},
		}
	end,
}
