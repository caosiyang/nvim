return {
	{
		"lewis6991/gitsigns.nvim",
		opts = {},
	},
	{
		"sindrets/diffview.nvim",
		opts = {},
		keys = {
			{ "<leader>do", "<cmd>DiffviewOpen<cr>", desc = "Git Diff Open (side-by-side)", mode = "n", noremap = true, silent = true, },
			{ "<leader>dc", "<cmd>DiffviewClose<cr>", desc = "Git Diff Close (side-by-side)", mode = "n", noremap = true, silent = true, },
		},
	},
}
