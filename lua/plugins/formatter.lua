return {
	-- code formatter
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				python = { "isort", "black" },
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
				desc = "Conform: 格式化代码",
				noremap = true,
				silent = true,
			},
			{
				"<leader>I",
				function()
					require("conform").format({ formatters = { "isort" }, async = true, lsp_fallback = true })
				end,
				mode = { "n", "v" },
				desc = "Conform: 格式化imports",
				noremap = true,
				silent = true,
			},
		},
	},
}
