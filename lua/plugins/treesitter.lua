return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
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

			local function map_textobj(key, query, mode)
				vim.keymap.set(mode or "o", key, function()
					require("nvim-treesitter-textobjects.select").select_textobject(query, "textobjects")
				end)
			end

			map_textobj("af", "@function.outer")
			map_textobj("if", "@function.inner")
			map_textobj("ac", "@class.outer")
			map_textobj("ic", "@class.inner")
		end,
	},
}
