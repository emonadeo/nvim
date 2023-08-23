return {
	"hrsh7th/nvim-cmp",
	version = false, -- last release is way too old
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"saadparwaiz1/cmp_luasnip",
	},
	opts = function()
		local cmp = require("cmp")
		local border_opts = {
			border = "rounded",
			winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
		}

		return {
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
				["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
				["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
				["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
				["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
				["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
				["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
				["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
				["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
				["<C-e>"] = cmp.mapping.abort(),
				-- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				-- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				["<S-CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					elseif has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp", priority = 1000 },
				{ name = "luasnip", priority = 750 },
				{ name = "buffer", priority = 500 },
				{ name = "path", priority = 250 },
			}),
			window = {
				completion = cmp.config.window.bordered(border_opts),
				documentation = cmp.config.window.bordered(border_opts),
			},
			confirm_opts = {
				behavior = cmp.ConfirmBehavior.Replace,
				select = false,
			},
			duplicates = {
				nvim_lsp = 1,
				luasnip = 1,
				cmp_tabnine = 1,
				buffer = 1,
				path = 1,
			},
		}
	end,
	-- opts = function()
	-- 	vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
	-- 	local cmp = require("cmp")
	-- 	local defaults = require("cmp.config.default")()
	-- 	return {
	-- 		completion = {
	-- 			completeopt = "menu,menuone,noinsert",
	-- 		},
	-- 		snippet = {
	-- 			expand = function(args)
	-- 				require("luasnip").lsp_expand(args.body)
	-- 			end,
	-- 		},
	-- 		mapping = cmp.mapping.preset.insert({
	-- 			["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
	-- 			["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
	-- 			["<C-b>"] = cmp.mapping.scroll_docs(-4),
	-- 			["<C-f>"] = cmp.mapping.scroll_docs(4),
	-- 			["<C-Space>"] = cmp.mapping.complete(),
	-- 			["<C-e>"] = cmp.mapping.abort(),
	-- 			["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	-- 			["<S-CR>"] = cmp.mapping.confirm({
	-- 				behavior = cmp.ConfirmBehavior.Replace,
	-- 				select = true,
	-- 			}), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	-- 		}),
	-- 		sources = cmp.config.sources({
	-- 			{ name = "nvim_lsp" },
	-- 			{ name = "luasnip" },
	-- 			{ name = "buffer" },
	-- 			{ name = "path" },
	-- 		}),
	-- 		experimental = {
	-- 			ghost_text = {
	-- 				hl_group = "CmpGhostText",
	-- 			},
	-- 		},
	-- 		sorting = defaults.sorting,
	-- 	}
	-- end,
}
