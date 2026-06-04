-- Package manager (auto-install LSP, formatter, linter)
return {
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "mason-org/mason.nvim" },
		opts = {
			ensure_installed = {
				-- LSP
				"pyright", -- python: type checking, completion, goto
				"ruff", -- python: lint, quick fix
				"lua_ls", -- lua: completion, goto, diagnostics
				-- Formatter
				"stylua", -- lua formatter
				"ruff", -- python formatter (ruff format)
				-- Linter
				"selene", -- lua linter
			},
			auto_update = false,
			run_on_start = true,
		},
	},
}
