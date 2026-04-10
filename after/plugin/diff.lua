require("mini.diff").setup({
	view = { style = "sign" },
	mappings = {
		-- Unbind apply mapping because it doesn't make sense with jj
		apply = "",
	},
	source = {
		require("mini.diff").gen_source.git(),
		require("emonadeo.diff").jj(),
	},
})
