return {
	"williamboman/mason.nvim",
	cmd = "Mason",
	keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
	build = ":MasonUpdate",
	opts = {
		ensure_installed = {
			"astro-language-server",
			"eslint-lsp",
			"prettier",
			"pyright",
			"stylua",
			"svelte-language-server",
			"typescript-language-server",
			"vue-language-server",
			"json-lsp",
			"rust-analyzer",
			"black",
		},
	},
	---@param opts MasonSettings | {ensure_installed: string[]}
	config = function(_, opts)
		require("mason").setup(opts)
		local mr = require("mason-registry")
		local function ensure_installed()
			for _, tool in ipairs(opts.ensure_installed) do
				local p = mr.get_package(tool)
				if not p:is_installed() then
					p:install()
				end
			end
		end
		if mr.refresh then
			mr.refresh(ensure_installed)
		else
			ensure_installed()
		end
	end,
}
