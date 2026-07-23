return {
	{
		"navarasu/onedark.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("onedark").setup({
				style = "darker",
				transparent = true,
				highlights = {
					-- Bufferline / Tabline
					TabLineFill = { bg = "NONE" },
					-- Statusline
					StatusLine = { bg = "NONE" },
					StatusLineNC = { bg = "NONE" },

					DiagnosticFloatBg = { bg = "#1e1e1e" },
				},
			})
			require("onedark").load()
		end,
	},
}
