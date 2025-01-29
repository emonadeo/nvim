return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@module "snacks"
	---@type snacks.Config
	opts = {
		rename = { enabled = true },
		words = { enabled = true },
	},
	keys = {
		{
			"]]",
			function() require("snacks").words.jump(vim.v.count1) end,
			desc = "Next Reference",
			mode = { "n", "t" },
		},
		{
			"[[",
			function() require("snacks").words.jump(-vim.v.count1) end,
			desc = "Previous Reference",
			mode = { "n", "t" },
		},
	},
	init = function()
		-- also set keys after loading ftplugins, since a lot overwrite `[[` and `]]`
		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				local buffer = vim.api.nvim_get_current_buf()
				vim.keymap.set(
					"n",
					"]]",
					function() require("snacks").words.jump(vim.v.count1) end,
					{ desc = "Next Reference", buffer = buffer }
				)
				vim.keymap.set(
					"n",
					"[[",
					function() require("snacks").words.jump(-vim.v.count1) end,
					{ desc = "Previous Reference", buffer = buffer }
				)
			end,
		})
	end,
}
