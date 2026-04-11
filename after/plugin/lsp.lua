vim.lsp.enable({
	"astro",
	"biome",
	"ccls",
	"cssls",
	"denols",
	"dockerls",
	"emmet_language_server",
	"eslint",
	"gleam",
	"gopls",
	"html",
	"jdtls",
	"jsonls",
	"lua_ls",
	"nil_ls",
	"nushell",
	"ols",
	"oxlint",
	"pyright",
	"ruff",
	"rumdl", -- markdown
	"rust_analyzer",
	"tombi", -- toml
	"tsgo",
	"vtsls",
	"wgsl_analyzer",
	"zls",
})

vim.lsp.config("dockerls", {
	filetypes = { "containerfile", "Containerfile", "dockerfile", "Dockerfile" },
})

vim.lsp.config("jsonls", {
	init_options = {
		provideFormatter = false,
	},
})

vim.lsp.config("pyright", {
	settings = {
		pyright = {
			-- using ruff's import organizer
			disableOrganizeImports = true,
		},
		python = {
			analysis = {
				-- ignore all files for analysis to exclusively use ruff for linting
				ignore = { "*" },
			},
		},
	},
})

vim.lsp.config("ruff", {
	on_init = function(client) client.server_capabilities.hoverProvider = false end,
})

vim.lsp.config("rust_analyzer", {
	settings = {
		["rust-analyzer"] = {
			cargo = {
				features = "all",
			},
		},
	},
})

require("lazydev").setup({
	library = {
		{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
	},
})
