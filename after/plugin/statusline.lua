-- TODO: Remove once lualine supports mini.icons
-- See <https://github.com/nvim-lualine/lualine.nvim/issues/1378>
require("mini.icons").mock_nvim_web_devicons()

require("lualine").setup({
	options = {
		component_separators = "",
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = {
			{ "mode", separator = { left = "", right = "" }, padding = 0 },
		},
		lualine_b = {
			{ "diagnostics", padding = { left = 2, right = 1 } },
		},
		lualine_c = {
			{
				"filetype",
				icon_only = true,
				padding = { left = 2, right = 0 },
			},
			{
				"filename",
				symbols = {
					modified = " ",
					readonly = " ",
					unnamed = "",
				},
			},
		},
		lualine_x = { "progress", { "location", padding = { left = 1, right = 2 } } },
		lualine_y = {
			{
				"lsp_status",
				icon = "LSP ┊",
				separator = { left = "", right = "" },
				symbols = { spinner = { "", "", "", "", "", "" } },
			},
		},
		lualine_z = {},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {
			{
				"filetype",
				icon_only = true,
				padding = { left = 2, right = 0 },
			},
			{
				"filename",
				symbols = {
					modified = "",
					readonly = "",
					unnamed = "",
				},
			},
		},
		lualine_x = { "progress", "location" },
		lualine_y = {},
		lualine_z = {},
	},
})
