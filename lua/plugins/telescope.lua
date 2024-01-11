return {

	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			defaults = {
				prompt_prefix = " ",
				selection_caret = " ",
				entry_prefix = " ",
			},
			extensions = {
				fzf = {
					fuzzy = true,    -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
					-- the default case_mode is "smart_case"
				},
				project = {},
			},
		},
		keys = {
			{ "<leader>fb", "<Cmd>Telescope buffers<CR>",     desc = "Find Buffers" },
			{ "<leader>ff", "<Cmd>Telescope find_files<CR>",  desc = "Find Files" },
			{ "<leader>fg", "<Cmd>Telescope live_grep<CR>",   desc = "Find Grep" },
			{ "<leader>fc", "<Cmd>Telescope colorscheme<CR>", desc = "Find Colorschemes" },
			{ "<leader>fp", "<Cmd>Telescope project<CR>",     desc = "Find Projects" },
		},
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		config = function()
			require("telescope").load_extension("fzf")
		end,
	},

	{
		"nvim-telescope/telescope-project.nvim",
		init = function()
			require("telescope").load_extension("project")
		end,
	},

	{
		"nvim-telescope/telescope-ui-select.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			require("telescope").load_extension("ui-select")
		end,
	},
}
