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

-- Integrate codesettings with rustacean.nvim
-- See `:help codesettings.nvim-quick-start-rustaceanvim`
vim.lsp.config("rust-analyzer", {
	before_init = function(init_params, config)
		local codesettings = require("codesettings")
		codesettings.with_local_settings(config.name, config)
		-- Some settings must be passed at init time, for example rust-analyzer.workspace.discoverConfig
		if config.default_settings and config.default_settings[config.name] then
			init_params.initializationOptions = config.default_settings[config.name]
		end
	end,
})

require("lazydev").setup({
	library = {
		{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
	},
})
