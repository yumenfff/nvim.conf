return {
	{
		"neovim/nvim-lspconfig",
		dependencies = { "hrsh7th/cmp-nvim-lsp" },
		config = function()
			local languages = require("core.languages")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			vim.lsp.config("*", {
				capabilities = capabilities,
			})

			vim.lsp.config("ruff", {
				init_options = {
					settings = {
						lint = { enable = false },
					},
				},
			})

			vim.lsp.config("pyright", {
				settings = {
					python = {
						analysis = {
							diagnosticSeverityOverrides = {
								reportUnusedImport = "none",
								reportUnusedVariable = "none",
								reportUndefinedVariable = "none",
							},
						},
					},
				},
			})

			local servers = {}
			local seen = {}
			for _, lang in pairs(languages) do
				if lang.lsp and not seen[lang.lsp] then
					seen[lang.lsp] = true
					table.insert(servers, lang.lsp)
				end
			end

			vim.lsp.enable(servers)

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
					local opts = { buffer = ev.buf }
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
					vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
					vim.keymap.set("n", "<Leader>D", vim.lsp.buf.type_definition, opts)
					vim.keymap.set("n", "<Leader>lr", vim.lsp.buf.rename, { buffer = ev.buf, desc = "Rename Symbol" })
					vim.keymap.set({ "n", "v" }, "<Leader>la", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "<Leader>lf", function()
						require("conform").format({ bufnr = ev.buf, lsp_format = "fallback" })
					end, opts)
				end,
			})
		end,
	},
}
