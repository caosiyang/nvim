return {
	{
		"rshkarin/mason-nvim-lint",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-lint",
		},
		opts = {
			ensure_installed = {
				"selene",
			},
			automatic_installation = true,
		},
	},

	{
		"mfussenegger/nvim-lint",
		dependencies = {},
		opts = {
			linters_by_ft = {
				lua = { "selene" },
			},
		},
		config = function(_, opts)
			local lint = require("lint")

			lint.linters_by_ft = opts.linters_by_ft

			vim.keymap.set("n", "<leader>L", function()
				lint.try_lint()
			end, { desc = "代码检查(nvim-lint)", noremap = true, silent = true })

			vim.diagnostic.config({
				float = {
					border = "single",
					source = "always",
					header = "",
					prefix = "",
					format = function(diagnostic)
						return string.format(
							"[%s] %s: %s",
							diagnostic.source,
							diagnostic.code,
							diagnostic.message
						)
					end,
				},

				vim.keymap.set("n", "<leader>D", function()
					vim.diagnostic.open_float(nil, {
						focusable = false,
						close_events = { "BufLeave", "InsertEnter", "CursorMoved" },
					})
				end, { desc = "show diagnostic information", noremap = true, silent = true }),
			})
		end,
	},
}
