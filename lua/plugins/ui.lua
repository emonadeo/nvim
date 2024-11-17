return {
	{
		"echasnovski/mini.icons",
		version = false,
		opts = {},
	},

	-- indent guides
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			indent = {
				char = "│", -- or "│", "▏", "▎"
				tab_char = "│", -- or "│", "▏", "▎"
				highlight = {
					"Whitespace",
				},
				smart_indent_cap = true,
				priority = 1,
			},
			whitespace = {
				highlight = {
					"Whitespace",
				},
			},
			scope = { enabled = false },
		},
	},

	-- command popup
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			spec = {
				{ "<leader>b", group = "Buffer" },
				{ "<leader>c", group = "Code" },
				{ "<leader>f", group = "Find" },
				{ "<leader>u", group = "UI" },
				{ "[", group = "Previous" },
				{ "]", group = "Next" },
				{ "g", group = "Goto" },
				{ "gs", group = "Surround" },
			},
		},
	},

	-- notifications
	-- TODO: cleanup
	{
		"rcarriga/nvim-notify",
		event = "VeryLazy",
		keys = {
			{
				"<leader>un",
				function()
					require("notify").dismiss({ silent = true, pending = true })
				end,
				desc = "Dismiss all Notifications",
			},
		},
		opts = {
			timeout = 3000,
			max_height = function()
				return math.floor(vim.o.lines * 0.75)
			end,
			max_width = function()
				return math.floor(vim.o.columns * 0.75)
			end,
			on_open = function(win)
				vim.api.nvim_win_set_config(win, { zindex = 100 })
			end,
		},
		init = function()
			vim.notify = require("notify")
		end,
	},

	-- ui components
	-- TODO: cleanup
	{ "MunifTanjim/nui.nvim", lazy = true },
}
