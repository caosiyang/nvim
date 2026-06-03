-- Colorscheme
return {
	{
		"EdenEast/nightfox.nvim",
		lazy = false,
		priority = 1000,
		opts = { style = "nightfox" },
		config = function(_, opts)
			require("nightfox").setup(opts)
			-- available themes: nightfox, dayfox, dawnfox, duskfox, nordfox, terafox, carbonfox
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
