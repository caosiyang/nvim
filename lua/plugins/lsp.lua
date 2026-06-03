return {
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
		opts = {
			ensure_installed = {
				-- python
				"pyright",
				"ruff",
				-- lua
				"lua_ls",
				"stylua",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		keys = {
			{ "<leader>rn", vim.lsp.buf.rename, mode = "n", desc = "rename function/variable", noremap = true, silent = true, },
			{ "<F2>", vim.lsp.buf.rename, mode = "n", desc = "rename function/variable", noremap = true, silent = true, },
			{ "gd", vim.lsp.buf.definition, mode = "n", desc = "go to definition", noremap = true, silent = true, },
			{ "gr", vim.lsp.buf.references, mode = "n", desc = "find references", noremap = true, silent = true, },
			{ "K", vim.lsp.buf.hover, mode = "n", desc = "LSP: 悬停查看信息", noremap = true, silent = true, },
			{ "<leader>e", function() vim.lsp.diagnostic.open_float() end, mode = "n", desc = "LSP: 显示诊断信息", noremap = true, silent = true, },
		},
	},
}
