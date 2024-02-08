local M = {}
-- {{{ Highlight Hints
-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors
-- ---------------------------------------------------------------- }}}
-- {{{ Highlight Overrides
---@type Base46HLGroupsList
M.override = {
	Comment = {
		italic = true,
	},
	NvimTreeGitDirty = { fg = "yellow" },
	NvimTreeRootFolder = {
		fg = "",
		bold = true,
	},
	Folded = {
		bg = "base00",
	},
}

--- ---------------------------------------------------------------- }}}
return M
