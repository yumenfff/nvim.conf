return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local colors = {
				normal = "#8EBD6B",
				insert = "#4FA6ED",
				command = "#E2B86B",
				visual = "#BF68D9",
				replace = "#E55561",
				terminal = "#48B0BD",
				section_bg = "#323641",
				fg_dark = "#080808",
				fg_light = "#C6C6C6",
				fg_inactive = "#535965",
			}

			local my_theme = {
				normal = {
					a = { fg = colors.fg_dark, bg = colors.normal },
					b = { fg = colors.fg_light, bg = colors.section_bg },
					c = { fg = colors.fg_light, bg = "none" },
					x = { fg = colors.fg_light, bg = "none" },
					y = { fg = colors.fg_light, bg = colors.section_bg },
					z = { fg = colors.fg_dark, bg = colors.normal },
				},
				insert = {
					a = { fg = colors.fg_dark, bg = colors.insert },
					z = { fg = colors.fg_dark, bg = colors.insert },
				},
				visual = {
					a = { fg = colors.fg_dark, bg = colors.visual },
					z = { fg = colors.fg_dark, bg = colors.visual },
				},
				replace = {
					a = { fg = colors.fg_dark, bg = colors.replace },
					z = { fg = colors.fg_dark, bg = colors.replace },
				},
				command = {
					a = { fg = colors.fg_dark, bg = colors.command },
					z = { fg = colors.fg_dark, bg = colors.command },
				},
				terminal = {
					a = { fg = colors.fg_dark, bg = colors.terminal },
					z = { fg = colors.fg_dark, bg = colors.terminal },
				},
				inactive = {
					a = { fg = colors.fg_inactive, bg = "none" },
					b = { fg = colors.fg_inactive, bg = "none" },
					c = { fg = colors.fg_inactive, bg = "none" },
					x = { fg = colors.fg_inactive, bg = "none" },
					y = { fg = colors.fg_inactive, bg = "none" },
					z = { fg = colors.fg_inactive, bg = "none" },
				},
			}

			require("lualine").setup({
				options = {
					theme = my_theme,
					globalstatus = true,
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "filename", "branch" },
					lualine_c = {},
					lualine_x = {},
					lualine_y = { "filetype", "progress" },
					lualine_z = { "location" },
				},
			})
		end,
	},
}
