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

	-- statusline
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = function()
			return {
				options = {
					theme = "auto",
					globalstatus = true,
					disabled_filetypes = { statusline = { "dashboard", "alpha" } },
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch" },
					lualine_c = {
						{
							"diagnostics",
							symbols = {
								error = "E",
								warn = "W",
								info = "I",
								hint = "H",
							},
						},
						{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
						{ "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
						{
							function()
								return require("nvim-navic").get_location()
							end,
							cond = function()
								return package.loaded["nvim-navic"] and require("nvim-navic").is_available()
							end,
						},
					},
					lualine_x = {
						{
							function()
								return require("noice").api.status.command.get()
							end,
							cond = function()
								return package.loaded["noice"] and require("noice").api.status.command.has()
							end,
						},
						{
							function()
								return require("noice").api.status.mode.get()
							end,
							cond = function()
								return package.loaded["noice"] and require("noice").api.status.mode.has()
							end,
						},
						{
							function()
								return "  " .. require("dap").status()
							end,
							cond = function()
								return package.loaded["dap"] and require("dap").status() ~= ""
							end,
						},
						{
							"diff",
							symbols = {
								added = "A",
								modified = "M",
								removed = "D",
							},
						},
					},
					lualine_y = {
						{ "progress", separator = " ",                  padding = { left = 1, right = 0 } },
						{ "location", padding = { left = 0, right = 1 } },
					},
					lualine_z = {
						function()
							return " " .. os.date("%R")
						end,
					},
				},
				extensions = { "neo-tree", "lazy" },
			}
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
				["<leader>p"] = { name = "Project" },
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

	-- icons
	{
		"nvim-tree/nvim-web-devicons",
		lazy = true,
	},

	-- ui components
	{ "MunifTanjim/nui.nvim", lazy = true },
}
