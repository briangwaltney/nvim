---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require("custom.highlights")

M.ui = {
	theme = "nord",
	theme_toggle = { "nord", "one_light" },
	statusline = {
		theme = "vscode_colored",
	},

	hl_override = highlights.override,
	hl_add = highlights.add,
	changed_themes = {
		nord = {
			base_16 = {
				base00 = "#252a34",
				-- base01 = "#3B4252",
				-- base02 = "#434C5E",
				base02 = "#2b364e",
				-- base03 = "#4C566A",
				-- base04 = "#D8DEE9",
				-- base05 = "#E5E9F0",
				-- base06 = "#ECEFF4",
				-- base07 = "#8FBCBB",
				-- base08 = "#88C0D0",
				base09 = "#fca5a5",
				-- base0A = "#88C0D0",
				base0B = "#d9f99d",
				-- base0C = "#81A1C1",
				base0D = "#38bdf8",
				base0E = "#fdba74",
				base0F = "#fca5a5",
			},
			base_30 = {
				-- white = "#abb2bf",
				-- darker_black = "#2a303c",
				-- black = "#2E3440", --  nvim bg
				black2 = "#494f5b",
				-- one_bg = "#373d49",
				-- one_bg2 = "#464c58",
				-- one_bg3 = "#494f5b",
				-- grey = "#4b515d",
				-- grey_fg = "#565c68",
				-- grey_fg2 = "#606672",
				-- light_grey = "#646a76",
				red = "#fca5a5",
				-- baby_pink = "#de878f",
				-- pink = "#d57780",
				-- line = "#414753", -- for lines like vertsplit
				-- green = "#A3BE8C",
				-- vibrant_green = "#afca98",
				-- blue = "#7797b7",
				-- nord_blue = "#81A1C1",
				-- yellow = "#EBCB8B",
				-- sun = "#e1c181",
				purple = "#e1c181",
				-- dark_purple = "#a983a2",
				-- teal = "#6484a4",
				-- orange = "#e39a83",
				-- cyan = "#9aafe6",
				-- statusline_bg = "#333945",
				-- lightbg = "#3f4551",
				-- pmenu_bg = "#A3BE8C",
				-- folder_bg = "#7797b7",
				base00 = "#252a34",
			},
		},
	},
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require("custom.mappings")

return M
