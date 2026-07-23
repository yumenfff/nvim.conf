-- Leader
vim.g.mapleader = " "

--  To normal mode
vim.keymap.set("i", "jk", "<Esc>")

-- Neo-tree
vim.keymap.set("n", "<leader>e", function()
	vim.cmd("Neotree left toggle reveal")
end)

-- Navigation
vim.keymap.set("n", "<c-k>", function()
	vim.cmd("wincmd k")
end)
vim.keymap.set("n", "<c-j>", function()
	vim.cmd("wincmd j")
end)
vim.keymap.set("n", "<c-h>", function()
	vim.cmd("wincmd h")
end)
vim.keymap.set("n", "<c-l>", function()
	vim.cmd("wincmd l")
end)

-- Splits
vim.keymap.set("n", "|", function()
	vim.cmd("vsplit")
end)
vim.keymap.set("n", "\\", function()
	vim.cmd("split")
end)

-- Tabs
vim.keymap.set("n", "<Tab>", function()
	vim.cmd("BufferLineCycleNext")
end)
vim.keymap.set("n", "<s-Tab>", function()
	vim.cmd("BufferLineCyclePrev")
end)
vim.keymap.set("n", "<c-x>", function()
	vim.cmd("BufferLineCloseOthers")
end)
vim.keymap.set("n", "<leader>x", function()
	vim.cmd("BufferLinePickClose")
end)

-- Diagnostics
vim.keymap.set("n", "<leader>d", function()
	local _, winid = vim.diagnostic.open_float()
	if winid then
		vim.wo[winid].winhighlight = "Normal:DiagnosticFloatBg,FloatBorder:DiagnosticFloatBg"
		vim.keymap.set("n", "q", function()
			vim.api.nvim_win_close(winid, true)
		end, { buffer = vim.api.nvim_win_get_buf(winid) })
	end
end)

-- Others
vim.keymap.set("n", "<esc>", function()
	vim.cmd("noh")
end)
