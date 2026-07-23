return {
	lua = {
		lsp = "lua_ls",
		formatter = { "stylua", lsp_format = "fallback" },
	},
	python = {
		lsp = "pyright",
		formatter = { "ruff_format", lsp_format = "fallback" },
		linter = { "ruff" },
	},
	typescript = {
		lsp = "ts_ls",
		formatter = { "prettier", lsp_format = "fallback" },
		linter = { "eslint" },
	},
	typescriptreact = {
		lsp = "ts_ls",
		formatter = { "prettier", lsp_format = "fallback" },
		linter = { "eslint" },
	},
	javascript = {
		lsp = "ts_ls",
		formatter = { "prettier", lsp_format = "fallback" },
		linter = { "eslint" },
	},
	javascriptreact = {
		lsp = "ts_ls",
		formatter = { "prettier", lsp_format = "fallback" },
		linter = { "eslint" },
	},
	rust = {
		lsp = "rust_analyzer",
		formatter = { "rustfmt", lsp_format = "fallback" },
	},
	go = {
		lsp = "gopls",
		formatter = { "gofmt", lsp_format = "fallback" },
	},
	java = {
		lsp = "jdtls",
	},
	sh = {
		lsp = "bashls",
		formatter = { "shfmt", lsp_format = "fallback" },
		linter = { "shellcheck" },
	},
}
