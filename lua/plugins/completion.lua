return {
	{
		"folke/lazydev.nvim",
		ft = "lua",
	},
	{
		"Saghen/blink.cmp",
		lazy = false, -- lazy loading handled internally
		version = "v0.*",
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = { preset = "default" },
			nerd_font_variant = "normal",
			sources = {
				-- add lazydev to your completion providers
				completion = {
					enabled_providers = { "lsp", "path", "snippets", "buffer", "lazydev" },
				},
				providers = {
					-- dont show LuaLS require statements when lazydev has items
					lsp = { fallback_for = { "lazydev" } },
					lazydev = { name = "LazyDev", module = "lazydev.integrations.blink" },
				},
			},
			windows = {
				autocomplete = {
					border = "rounded",
				},
			},
		},
	},
}
