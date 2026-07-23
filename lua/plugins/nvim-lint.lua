return {
	{
		"mfussenegger/nvim-lint",
		config = function()
			local languages = require("core.languages")

			local linters_by_ft = {}
			for ft, lang in pairs(languages) do
				if lang.linter then
					linters_by_ft[ft] = lang.linter
				end
			end

			require("lint").linters_by_ft = linters_by_ft

			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	},
}
