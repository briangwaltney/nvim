-- {{{ Options

vim.opt.scrolloff = 16
vim.opt.relativenumber = true
vim.opt.spelllang = "en_us"
vim.opt.spell = true
vim.opt.fillchars = { fold = " ", eob = " " }
vim.opt.foldmethod = "marker"
vim.opt.foldlevel = 0
vim.opt.timeoutlen = 200
vim.g.lua_snippets_path = vim.fn.stdpath("config") .. "/lua/custom/lua_snippets"

-- ---------------------------------------------------------------------------------- }}}
-- {{{ Goto last location when opening a buffer.

vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- --------------------------------------------------------------------------------------------- }}}
-- {{{ Turn off comment continue comments

vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.opt_local.formatoptions:remove("r")
	end,
})

-- ---------------------------------------------------------------------------------- }}}
