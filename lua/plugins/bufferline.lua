return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = { "nvim-tree/nvim-web-devicons", "famiu/bufdelete.nvim" },
		config = function()
			local bufferline = require("bufferline")
			bufferline.setup({
				options = {
					mode = "buffer",
					numbers = "none",
					show_buffer_close_icons = false,
					diagnostics = "nvim_lsp",
					diagnostics_indicator = function(count, level, diagnostics_dict, context)
						local s = " "
						for e, _ in pairs(diagnostics_dict) do
							local sym = e == "error" and " " or (e == "warning" and " " or " ")
							s = s .. sym
						end
						return s
					end,
					always_show_bufferline = true,
					close_command = function(n)
						vim.api.nvim_set_current_buf(n)
						SmartClose()
					end,
					right_mouse_command = function(n)
						vim.api.nvim_set_current_buf(n)
						SmartClose()
					end,
				},
			})
		end,
	},
}
