return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			notifier = {
				timeout = 4000,
				style = "compact", -- compact, minimal, fancy
				width = {
					min = 0.3,
					max = 0.4,
				},
				height = {
					min = 1,
					max = 0.4,
				},
			},
			styles = {
				notification = {
					border = "single",
					wo = {
						wrap = true,
					},
				},
			},

			bigfile = { enabled = false },
			dashboard = { enabled = false },
			indent = { enabled = false },
			input = { enabled = false },
			picker = { enabled = false },
			quickfile = { enabled = false },
			scope = { enabled = false },
			scroll = { enabled = true },
			statuscolumn = { enabled = false },
			terminal = { enabled = false },
			words = { enabled = false },
			zen = { enabled = false },
		},
	},
}
