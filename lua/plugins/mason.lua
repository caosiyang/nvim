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
				"bash-language-server", -- bash/sh: completion, goto, diagnostics
				-- Formatter
				"stylua", -- lua formatter
				"ruff", -- python formatter (ruff format)
				"shfmt", -- bash/sh formatter
				-- Linter
				"selene", -- lua linter
				"shellcheck", -- bash/sh linter (used by bash-language-server)
			},
			auto_update = false,
			run_on_start = true,
		},
	},
}
