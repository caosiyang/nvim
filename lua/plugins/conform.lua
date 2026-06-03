-- Code formatter
return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				python = { "ruff_organize_imports", "ruff_format" },
				lua = { "stylua" },
			},
			format_on_save = false,
		},
		keys = {
			{
				"<leader>F",
				function()
					require("conform").format({ async = false, lsp_fallback = true, timeout_ms = 1000 })
				end,
				mode = { "n", "v" },
				desc = "Conform: format code",
				noremap = true,
				silent = true,
			},
		},
	},
}
