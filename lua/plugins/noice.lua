return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		opts = {
			notify = {
				enabled = false,
			},
			cmdline = {
				enabled = true,
				view = "cmdline_popup",
				format = {
					cmdline = { pattern = "^:", icon = "", lang = "vim" },
					search_down = { kind = "search", pattern = "^/", icon = "", lang = "regex" },
					search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
					filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
					lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
					input = { view = "cmdline_input", icon = "󰥻 " },
				},
			},
			popupmenu = {
				enabled = false,
			},

			lsp = {
				progress = { enabled = false },
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = false,
					["vim.lsp.util.stylize_markdown"] = false,
					["cmp.entry.get_documentation"] = false,
				},
				hover = { enabled = false },
				signature = { enabled = false },
				message = { enabled = false },
			},
			health = {
				checker = false,
			},
			presets = {
				bottom_search = false,
				command_palette = false,
				long_message_to_split = true,
				inc_rename = false,
				lsp_doc_border = false,
			},
			routes = {},
			views = {},
			status = {},
			format = {},
		},
	},
}
