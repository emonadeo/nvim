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
			hijack_netrw_behavior = "open_current",
			window = {
				position = "current",
			},
			follow_current_file = {
				enabled = true,
				leave_dirs_open = false,
			},
			filtered_items = {
				visible = true,
				hide_dotfiles = false,
			},
		},
		default_component_configs = {
			indent = {
				indent_size = 2,
				padding = 0,
				with_markers = true,
				indent_marker = "│",
				last_indent_marker = "└",
				highlight = "NeoTreeIndentMarker",
			},
			icon = {
				folder_closed = "",
				folder_open = "",
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
		window = {
			auto_expand_width = true,
		},
	},
	keys = {
		{ "<leader>e", "<cmd>Neotree toggle<CR>", desc = "Toggle File Explorer" },
	},
}
