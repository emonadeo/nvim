return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		plugins = { spelling = true },
		defaults = {
			mode = { "n", "v" },
			["g"] = { name = "Goto" },
			["gz"] = { name = "Surround" },
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
}
