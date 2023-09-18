return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	opts = {
		popup_border_style = "rounded",
		source_selector = {
			winbar = false,
			statusline = false,
		},
		filesystem = {
			follow_current_file = { enabled = true },
			filtered_items = {
				visible = true,
				hide_dotfiles = false,
			},
		},
		default_component_configs = {
			icon = {
				folder_closed = "",
				folder_open = "",
				folder_empty = "",
				highlight = "NeoTreeFileIcon",
			},
			modified = {
				symbol = "",
				highlight = "NeoTreeModified",
			},
			name = {
				trailing_slash = true,
				use_git_status_colors = false,
				highlight = "NeoTreeFileName",
			},
			git_status = {
				symbols = {
					-- Change type
					added = "",
					modified = "",
					deleted = "", -- only in git_status source
					renamed = "", -- only in git_status source
					-- Status type
					untracked = "",
					ignored = "",
					unstaged = "",
					-- unstaged = "",
					staged = "",
					-- staged = "",
					conflict = "",
				},
			},
		},
		renderers = {
			directory = {
				{ "indent" },
				{ "icon" },
				{ "current_filter" },
				{
					"container",
					content = {
						{ "name", zindex = 10 },
						{
							"symlink_target",
							zindex = 10,
							highlight = "NeoTreeSymbolicLinkTarget",
						},
						{ "clipboard", zindex = 10 },
						{
							"diagnostics",
							errors_only = true,
							zindex = 20,
							align = "right",
							hide_when_expanded = true,
						},
						{ "git_status", zindex = 10, align = "right", hide_when_expanded = true },
						{ "file_size", zindex = 10, align = "right" },
						{ "type", zindex = 10, align = "right" },
						{ "last_modified", zindex = 10, align = "right" },
						{ "created", zindex = 10, align = "right" },
					},
				},
			},
		},
	},
	keys = {
		{ "<leader>E", "<cmd>Neotree toggle<CR>", desc = "Toggle File Explorer" },
		{
			"<leader>e",
			function()
				if vim.bo.filetype == "neo-tree" then
					vim.cmd.wincmd("p")
				else
					vim.cmd.Neotree("focus")
				end
			end,
			desc = "Focus File Explorer",
		},
	},
}
