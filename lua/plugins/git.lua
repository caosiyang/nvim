-- Git integration
return {
	{
		"lewis6991/gitsigns.nvim",
		opts = {},
	},
	{
		"sindrets/diffview.nvim",
		opts = {},
		keys = {
			{
				"<leader>gd",
				function()
					local view = require("diffview.lib").get_current_view()
					if view then
						vim.cmd("DiffviewClose")
					else
						vim.cmd("DiffviewOpen")
					end
				end,
				desc = "Git Diff Toggle (side-by-side)",
				mode = "n",
				noremap = true,
				silent = true,
			},
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
			{
				"<leader>gf",
				"<cmd>LazyGitCurrentFile<cr>",
				desc = "LazyGit (current file)",
				noremap = true,
				silent = true,
			},
		},
	},
}
