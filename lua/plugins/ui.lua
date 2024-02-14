return {
	-- dashboard
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		opts = function()
			local dashboard = require("alpha.themes.dashboard")
			local logo = [[        .:=+*####***++==---::
                   ...:#%%%%%=
                       -%%%%%%
                        #%%%%%=
              .--::..   :%%#*+=
              :%=:--==%%%%%%.
               %-     %%%%%%.
               #-     %%%%%%.
               **=---:%%#*=-.
                ...::--=+%%%%%#
                        :%%%%%*
                        =%%%%%=
                        +##*+=.]]

			dashboard.section.header.val = vim.split(logo, "\n")
			dashboard.section.buttons.val = {
				dashboard.button("p", " " .. " Projects", ":Telescope project <CR>"),
				dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
				dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
				dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
				dashboard.button("q", " " .. " Quit", ":qa<CR>"),
			}
			for _, button in ipairs(dashboard.section.buttons.val) do
				button.opts.hl = "AlphaButtons"
				button.opts.hl_shortcut = "AlphaShortcut"
			end
			dashboard.section.header.opts.hl = "AlphaHeader"
			dashboard.section.buttons.opts.hl = "AlphaButtons"
			dashboard.section.footer.opts.hl = "AlphaFooter"
			dashboard.opts.layout[1].val = 8
			return dashboard
		end,
		config = function(_, dashboard)
			require("alpha").setup(dashboard.opts)
		end,
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
			plugins = { spelling = true },
			defaults = {
				mode = { "n", "v" },
				["g"] = { name = "Goto" },
				["gs"] = { name = "Surround" },
				["]"] = { name = "Next" },
				["["] = { name = "Previous" },
				["<leader>b"] = { name = "Buffer" },
				["<leader>c"] = { name = "Code" },
				["<leader>f"] = { name = "Find" },
				["<leader>u"] = { name = "UI" },
			},
		},
		config = function(_, opts)
			local wk = require("which-key")
			wk.setup(opts)
			wk.register(opts.defaults)
		end,
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
		},
	},

	-- ui components
	-- TODO: cleanup
	{ "MunifTanjim/nui.nvim", lazy = true },
}
