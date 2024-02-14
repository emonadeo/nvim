return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-project.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
	},
	opts = {
		defaults = {
			prompt_prefix = " ",
			selection_caret = " ",
			entry_prefix = " ",
		},
		extensions = {
			fzf = {
				fuzzy = true, -- false will only do exact matching
				override_generic_sorter = true, -- override the generic sorter
				override_file_sorter = true, -- override the file sorter
				case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			},
			project = {},
		},
		pickers = {
			find_files = {
				-- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
				find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
			},
		},
	},
	config = function(_, opts)
		local telescope = require("telescope")
		telescope.setup(opts)
		telescope.load_extension("fzf")
		telescope.load_extension("project")
		telescope.load_extension("ui-select")
	end,
	keys = function()
		local builtin = require("telescope.builtin")
		local extensions = require("telescope").extensions
		return {
			{ "<leader>fb", builtin.buffers, desc = "Find Buffers" },
			{ "<leader>ff", builtin.find_files, desc = "Find Files" },
			{ "<leader>fg", builtin.live_grep, desc = "Find Grep" },
			{ "<leader>fc", builtin.colorscheme, desc = "Find Colorschemes" },
			{ "<leader>fp", extensions.project.project, desc = "Find Projects" },
		}
	end,
}
