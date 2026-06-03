return {
	{
		"EdenEast/nightfox.nvim",
		lazy = false,
		priority = 1000,
		opts = { style = "nightfox" },
		config = function(_, opts)
			require("nightfox").setup(opts)
			vim.cmd.colorscheme("nightfox")
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = { style = "moon" },
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		opts = {},
	},
}
