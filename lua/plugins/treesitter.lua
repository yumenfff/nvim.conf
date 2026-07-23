return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter").setup({
				install_dir = vim.fn.stdpath("data") .. "/site",
			})

			require("nvim-treesitter").install({ "python", "java", "go", "lua", "typescript", "javascript" })

			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "python", "java", "go", "lua", "typescript", "javascript" },
				callback = function()
					vim.treesitter.start()
				end,
			})
		end,
	},
}
