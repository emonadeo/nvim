require("snacks").setup(
	---@module "snacks"
	---@type snacks.Config
	{
		indent = { enabled = true },
		picker = { enabled = true },
		rename = { enabled = true },
		words = { enabled = true },
		statuscolumn = {
			enabled = true,
			left = { "mark", "sign" },
			right = { "fold", "git" },
			folds = {
				open = false, -- show open fold icons
				git_hl = true, -- use Git Signs hl for fold icons
			},
			git = {
				-- patterns to match Git signs
				patterns = { "MiniDiffSign" },
			},
		},
	}
)
