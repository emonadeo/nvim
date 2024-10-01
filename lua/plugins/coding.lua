return {
	-- ai
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		opts = {
			panel = {
				enabled = false,
			},
			suggestion = {
				enabled = true,
				auto_trigger = true,
				keymap = {
					accept = "<C-'>",
					accept_word = false,
					accept_line = false,
					dismiss = "<C-]>",
				},
			},
		},
	},

	-- camel case and snake case motions
	{
		"chrisgrieser/nvim-spider",
		lazy = true,
		keys = {
			{
				"w",
				function()
					require("spider").motion("w")
				end,
				mode = { "n", "o", "x" },
			},
			{
				"e",
				function()
					require("spider").motion("e")
				end,
				mode = { "n", "o", "x" },
			},
			{
				"b",
				function()
					require("spider").motion("b")
				end,
				mode = { "n", "o", "x" },
			},
		},
	},

	-- open links without netrw
	{
		"chrishrb/gx.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = { { "gx", "<cmd>Browse<cr>", mode = { "n", "x" } } },
		cmd = { "Browse" },
		config = true,
		init = function()
			vim.g.netrw_nogx = 1 -- disable netrw gx
		end,
	},

	-- auto pairs
	{
		"echasnovski/mini.pairs",
		event = "VeryLazy",
		opts = {
			skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
			skip_ts = { "string" },
			skip_unbalanced = true,
			markdown = true,
		},
	},

	-- auto tags
	{
		"windwp/nvim-ts-autotag",
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
	},

	-- surround actions
	{
		"echasnovski/mini.surround",
		opts = {
			silent = true,
			mappings = {
				add = "Sa", -- Add surrounding in Normal and Visual modes
				delete = "Sd", -- Delete surrounding
				find = "Sf", -- Find surrounding (to the right)
				find_left = "SF", -- Find surrounding (to the left)
				highlight = "Sh", -- Highlight surrounding
				replace = "Sr", -- Replace surrounding
				update_n_lines = "Sn", -- Update `n_lines`
			},
		},
	},
}
