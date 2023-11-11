return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		lazy = true,
		config = false,
	},

	{
		"neovim/nvim-lspconfig",
		cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
		event = { 'BufReadPre', 'BufNewFile' },
		dependencies = {
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'williamboman/mason-lspconfig.nvim' },
		},
		config = function()
			local lsp_zero = require('lsp-zero')
			lsp_zero.extend_lspconfig()
			lsp_zero.on_attach(function(client, bufnr)
				-- see :help lsp-zero-keybindings
				lsp_zero.default_keymaps({
					buffer = bufnr,
					preserve_mappings = false
				})
				-- enable format on save
				lsp_zero.buffer_autoformat()
			end)

			require('mason-lspconfig').setup({
				ensure_installed = {},
				handlers = {
					lsp_zero.default_setup,
					lua_ls = function()
						local lua_opts = lsp_zero.nvim_lua_ls()
						require('lspconfig').lua_ls.setup(lua_opts)
					end,
				}
			})
		end
	},

	{
		"williamboman/mason.nvim",
		lazy = false,
		config = true,
	},

	{ "williamboman/mason-lspconfig.nvim" },
}
