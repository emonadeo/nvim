vim.filetype.add({ extension = { wgsl = "wgsl" } })

return {
	"nvim-treesitter/nvim-treesitter",
	version = false, -- last release is way too old and doesn't work on Windows
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		"windwp/nvim-ts-autotag",
	},
	cmd = { "TSUpdateSync" },
	keys = {
		{ "<c-space>", desc = "Increment selection" },
		{ "<bs>", desc = "Decrement selection", mode = "x" },
	},
	opts = {
		autotag = {
			enable = true,
			enable_rename = true,
			enable_close = true,
			enable_close_on_slash = true,
		},
		highlight = { enable = true },
		indent = { enable = true },
		ensure_installed = {
			"astro",
			"bash",
			"c",
			"css",
			"hcl",
			"html",
			"java",
			"javascript",
			"jsdoc",
			"json",
			"json5",
			"jsonc",
			"lua",
			"luadoc",
			"luap",
			"markdown",
			"markdown_inline",
			"ninja",
			"python",
			"query",
			"regex",
			"rust",
			"scss",
			"svelte",
			"toml",
			"tsx",
			"typescript",
			"vue",
			"vim",
			"vimdoc",
			"yaml",
			"wgsl",
		},
		-- TODO: clean up
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<C-space>",
				node_incremental = "<C-space>",
				scope_incremental = false,
				node_decremental = "<bs>",
			},
		},
	},
	config = function(_, opts)
		if type(opts.ensure_installed) == "table" then
			---@type table<string, boolean>
			local added = {}
			opts.ensure_installed = vim.tbl_filter(function(lang)
				if added[lang] then
					return false
				end
				added[lang] = true
				return true
			end, opts.ensure_installed)
		end
		require("nvim-treesitter.configs").setup(opts)
	end,
}
