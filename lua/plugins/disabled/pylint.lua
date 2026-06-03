-- ========================================
-- 被 ruff 替代的旧 lint 配置（pylint）
-- 恢复方法：将 linter.lua 中 ruff 相关配置换回以下内容
-- ========================================
mason-nvim-lint ensure_installed:
{
	"pylint",
	"selene",
}

nvim-lint linters_by_ft:
{
	python = {
		"pylint",
	},
	lua = { "selene" },
}
