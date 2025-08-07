return {
	"nvzone/showkeys",
	cmd = "ShowkeysToggle",
	keys = {
		{
			"<leader>uk",
			function() require("showkeys").toggle() end,
			desc = "Toggle Showkeys",
		},
	},
}
