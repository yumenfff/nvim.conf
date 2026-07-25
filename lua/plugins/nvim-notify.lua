return {
	{
		"rcarriga/nvim-notify",
		opts = {
			render = "minimal",
			stages = "static",
			timeout = 4000,
			max_width = function()
				return math.floor(vim.o.columns * 0.35)
			end,
			max_height = function()
				return math.floor(vim.o.lines * 0.35)
			end,
			on_open = function(win)
				vim.wo[win].wrap = true
				vim.wo[win].linebreak = true
				vim.api.nvim_win_set_config(win, { border = "single" }) -- прямые углы
				-- vim.api.nvim_win_set_config(win, { border = 'none' }) -- без рамки
			end,
		},
		config = function(_, opts)
			require("notify").setup(opts)

			local colors = {
				normal = "#8EBD6B",
				insert = "#4FA6ED",
				command = "#E2B86B",
				visual = "#BF68D9",
				replace = "#E55561",
				terminal = "#48B0BD",
				section_bg = "#323641",
			}

			local function set_notify_highlights()
				vim.api.nvim_set_hl(0, "NotifyINFOBorder", { fg = colors.normal })
				vim.api.nvim_set_hl(0, "NotifyINFOIcon", { fg = colors.normal })
				vim.api.nvim_set_hl(0, "NotifyINFOTitle", { fg = colors.normal })
				vim.api.nvim_set_hl(0, "NotifyINFOBody", { bg = colors.section_bg })

				vim.api.nvim_set_hl(0, "NotifyWARNBorder", { fg = colors.command })
				vim.api.nvim_set_hl(0, "NotifyWARNIcon", { fg = colors.command })
				vim.api.nvim_set_hl(0, "NotifyWARNTitle", { fg = colors.command })
				vim.api.nvim_set_hl(0, "NotifyWARNBody", { bg = colors.section_bg })

				vim.api.nvim_set_hl(0, "NotifyERRORBorder", { fg = colors.replace })
				vim.api.nvim_set_hl(0, "NotifyERRORIcon", { fg = colors.replace })
				vim.api.nvim_set_hl(0, "NotifyERRORTitle", { fg = colors.replace })
				vim.api.nvim_set_hl(0, "NotifyERRORBody", { bg = colors.section_bg })

				vim.api.nvim_set_hl(0, "NotifyDEBUGBorder", { fg = colors.terminal })
				vim.api.nvim_set_hl(0, "NotifyDEBUGIcon", { fg = colors.terminal })
				vim.api.nvim_set_hl(0, "NotifyDEBUGTitle", { fg = colors.terminal })
				vim.api.nvim_set_hl(0, "NotifyDEBUGBody", { bg = colors.section_bg })

				vim.api.nvim_set_hl(0, "NotifyTRACEBorder", { fg = colors.visual })
				vim.api.nvim_set_hl(0, "NotifyTRACEIcon", { fg = colors.visual })
				vim.api.nvim_set_hl(0, "NotifyTRACETitle", { fg = colors.visual })
				vim.api.nvim_set_hl(0, "NotifyTRACEBody", { bg = colors.section_bg })
			end

			set_notify_highlights()

			vim.api.nvim_create_autocmd("ColorScheme", {
				callback = set_notify_highlights,
			})
		end,
	},
}
