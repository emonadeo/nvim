return {
	"nvim-telescope/telescope-project.nvim",
	init = function()
		require("telescope").load_extension("project")
	end,
}
