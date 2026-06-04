-- vim.keymap.set("n", "<leader>t", "<CMD>Neotree toggle<CR>", { desc = "Neotree Toggle", silent = true })

-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
-- vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Find References" })

-- vim.keymap.set("n", "<leader>I", function()
-- 	require("conform").format({ formatters = { "isort" }, async = true, lsp_fallback = false })
-- end, { desc = "Format python imports" })

-- vim.keymap.set("n", "<leader>fm", function()
-- 	require("conform").format({ async = false, lsp_fallback = true, timeout_ms = 1000 })
-- end, { desc = "Format code file" })
--
-- vim.keymap.set("v", "<leader>fm", function()
-- 	require("conform").format({ async = false, lsp_fallback = true, timeout_ms = 1000 })
-- end, { desc = "Format code selection" })

-- vim.keymap.set("V", "<leader>f",    function()
-- 	require("conform").format({ async = true, lsp_fallback = false })
-- end, { desc = "Format code selection" })

-- for todo-comments
-- vim.keymap.set("n", "]t", function()
-- 	require("todo-comments").jump_next()
-- end, { desc = "Next todo comment" })
--
-- vim.keymap.set("n", "[t", function()
-- 	require("todo-comments").jump_prev()
-- end, { desc = "Previous todo comment" })

vim.keymap.set("n", "<leader>m", function()
	if vim.o.mouse == "" then
		vim.o.mouse = "a"
		vim.notify("Mouse: enabled", vim.log.levels.INFO)
	else
		vim.o.mouse = ""
		vim.notify("Mouse: disabled", vim.log.levels.INFO)
	end
end, { desc = "Toggle mouse", noremap = true, silent = true })

-- You can also specify a list of valid jump keywords
-- vim.keymap.set("n", "]t", function()
--   require("todo-comments").jump_next({keywords = { "ERROR", "WARNING" }})
-- end, { desc = "Next error/warning todo comment" })
