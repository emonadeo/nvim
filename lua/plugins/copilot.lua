return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	opts = {
		panel = { enabled = false },
		suggestion = { enabled = true, auto_trigger = false },
		filetypes = {
			markdown = true,
		},
	},
	config = function(_, opts) require("copilot").setup() end,
	keys = {
		{
			"<C-;>",
			function() require("copilot.suggestion").accept() end,
			mode = "i",
			desc = "Trigger Copilot",
		},
	},
}
