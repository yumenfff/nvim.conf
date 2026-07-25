return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "modern",
			delay = 300,
		},
		config = function(_, opts)
			local wk = require("which-key")
			wk.setup(opts)
			wk.add({
				{ "<leader>e", desc = "Neo-tree toggle" },
				{ "<leader>d", desc = "Diagnostics float" },
				{ "<leader>x", desc = "Pick buffer to close" },
				{ "<leader>l", group = "LSP" },
				{ "<leader>lr", desc = "Rename symbol" },
				{ "<leader>la", desc = "Code action" },
				{ "<leader>lf", desc = "Format buffer" },
				{ "<leader>b", desc = "DAP: toggle breakpoint" },
				{ "<leader>B", desc = "DAP: conditional breakpoint" },
				{ "<leader>du", desc = "DAP: toggle UI" },
			})
		end,
	},
}
