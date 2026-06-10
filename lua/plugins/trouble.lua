-- Diagnostics list
return {
	{
		"folke/trouble.nvim",
		opts = {
			keys = {
				["<cr>"] = "jump_close",
				["<esc>"] = "close",
			},
		},
		cmd = "Trouble",
		keys = {
			{
				"<leader>D",
				"<cmd>Trouble diagnostics toggle focus=true win.type=float<cr>",
				desc = "Diagnostics (Float)",
			},
			{
				"<leader>dd",
				function()
					vim.diagnostic.open_float(nil, {
						focusable = false,
						close_events = { "BufLeave", "InsertEnter", "CursorMoved" },
					})
				end,
				desc = "Line Diagnostic",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
}
