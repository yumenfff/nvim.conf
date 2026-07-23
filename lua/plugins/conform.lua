return {
	{
		"stevearc/conform.nvim",
		config = function()
			local languages = require("core.languages")

			local formatters_by_ft = {}
			for ft, lang in pairs(languages) do
				if lang.formatter then
					formatters_by_ft[ft] = lang.formatter
				end
			end

			require("conform").setup({
				formatters_by_ft = formatters_by_ft,
			})

			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*",
				callback = function(args)
					require("conform").format({ bufnr = args.buf })
				end,
			})
		end,
	},
}
