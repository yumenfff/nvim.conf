return {
	{
		"mason-org/mason.nvim",
		opts = {
			ensure_installed = {
				"debugpy",
			},
		},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = { "mason-org/mason.nvim" },
		opts = {
			ensure_installed = {
				"pyright",
				"ruff",
			},
		},
	},
}
