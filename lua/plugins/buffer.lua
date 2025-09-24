return {
	"nvim-mini/mini.bufremove",
	version = false,
	opts = {},
	keys = {
		{
			"<leader>bd",
			function() require("mini.bufremove").delete() end,
			desc = "Delete buffer",
		},
		{
			"<leader>bD",
			function() require("mini.bufremove").delete(0, true) end,
			desc = "Delete buffer (force)",
		},
		{
			"<leader>bw",
			function() require("mini.bufremove").wipeout() end,
			desc = "Wipeout buffer",
		},
		{
			"<leader>bW",
			function() require("mini.bufremove").wipeout(0, true) end,
			desc = "Wipeout buffer (force)",
		},
	},
}
