return {
	{
		"hrsh7th/nvim-cmp",
		event = 'InsertEnter',
		dependencies = {
			{ 'L3MON4D3/LuaSnip' },
			{ 'onsails/lspkind.nvim' }
		},
		config = function()
			-- Here is where you configure the autocompletion settings.
			local lsp_zero = require('lsp-zero')
			lsp_zero.extend_cmp()

			-- And you can configure cmp even more, if you want to.
			local cmp = require('cmp')
			local cmp_action = lsp_zero.cmp_action()

			cmp.setup({
				preselect = 'item',
				completion = {
					completeopt = 'menu,menuone,noinsert',
				},
				formatting = {
					fields = { 'kind', 'abbr', 'menu' },
					format = require('lspkind').cmp_format({
						mode = 'symbol',
						maxwidth = 50,
						ellipsis_char = '...',
					})
				},
				mapping = cmp.mapping.preset.insert({
					['<C-Space>'] = cmp.mapping.complete(),
					['<CR>'] = cmp.mapping.confirm({ select = true }),
					['<Tab>'] = cmp_action.luasnip_supertab(),
					['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
				}),
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				}
			})
		end
	},
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "saadparwaiz1/cmp_luasnip" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-nvim-lua" },
}
