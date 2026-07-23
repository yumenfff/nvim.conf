-- Автоочистка пустых, безымянных, неизменённых буферов
vim.api.nvim_create_autocmd("BufHidden", {
	callback = function(args)
		local buf = args.buf
		if
			vim.api.nvim_buf_get_name(buf) == ""
			and vim.bo[buf].buftype == ""
			and not vim.bo[buf].modified
			and #vim.api.nvim_buf_get_lines(buf, 0, -1, false) <= 1
			and (vim.api.nvim_buf_get_lines(buf, 0, 1, false)[1] or "") == ""
		then
			vim.schedule(function()
				if vim.api.nvim_buf_is_valid(buf) then
					pcall(vim.api.nvim_buf_delete, buf, { force = true })
				end
			end)
		end
	end,
})

-- Smart close: закрывает текущую вкладку/буфер
local function smart_close()
	local buf = vim.api.nvim_get_current_buf()

	if vim.bo[buf].modified then
		vim.notify("E37: No write since last change", vim.log.levels.ERROR)
		return
	end

	local listed_bufs = vim.tbl_filter(function(b)
		return vim.api.nvim_buf_is_valid(b) and vim.bo[b].buflisted
	end, vim.api.nvim_list_bufs())

	local ok, err
	if #listed_bufs > 1 then
		ok, err = pcall(function()
			require("bufdelete").bufdelete(buf, false)
		end)
	else
		ok, err = pcall(function()
			vim.cmd("q")
		end)
	end

	if not ok then
		local msg = err:match(":%s*(.*)$") or err
		vim.notify(msg, vim.log.levels.ERROR)
	end
end

_G.SmartClose = smart_close

vim.cmd([[cnoreabbrev <expr> q (getcmdtype() == ':' && getcmdline() == 'q') ? 'lua SmartClose()' : 'q']])
vim.cmd([[cnoreabbrev <expr> wq (getcmdtype() == ':' && getcmdline() == 'wq') ? 'w<Bar>lua SmartClose()' : 'wq']])

return {
	smart_close = smart_close,
}
