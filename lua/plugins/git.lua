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
	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{ "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit", noremap = true, silent = true },
			{ "<leader>gf", "<cmd>LazyGitCurrentFile<cr>", desc = "LazyGit (current file)", noremap = true, silent = true },
		},
	},
}
