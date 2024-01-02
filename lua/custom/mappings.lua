---@type MappingsTable
local M = {}

M.disabled = {
	n = {
		-- Disable
		["<leader>n"] = { "" },
		["<tab>"] = { "" },
		["<S-tab>"] = { "" },
	},
}
-- test
M.general = {
	x = {
		["Q"] = { ":norm @q<CR>", "run macro q across all selected lines" },
	},
	n = {
		["<leader>t"] = { "<cmd> TroubleToggle<CR>", "trouble" },
		["Q"] = { "@qj", "run macro q" },
		["<C-q>"] = {
			function(bufnr)
				require("telescope.actions").smart_send_to_qflist(bufnr)
				require("telescope.builtin").quickfix()
			end,
			"Send to quickfix",
		},
		["<leader>q"] = { "<cmd>q<CR>", "close buffer" },
		["<leader><leader>s"] = { "<cmd>source ~/.config/nvim/lua/custom/snippets.lua<CR>" },
		["<leader><leader>l"] = { "<cmd>LspRestart<CR>" },
		["<leader>F"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "find all" },

		["<leader>dl"] = {
			"<cmd> Telescope diagnostics <CR>",
			"diagnostics list",
		},
		["<leader>vs"] = {
			"<cmd> vsplit <CR>",
			"vertical split",
		},

		["F"] = {
			function()
				vim.diagnostic.open_float({ border = "rounded" })
			end,
			"LSP hover",
		},

		["<c-Y>"] = {
			function()
				require("nvchad.tabufline").tabuflinePrev()
			end,
			"goto prev buffer",
		},

		["<Esc>"] = { ":noh<CR>", "clear highlights" },
		["<leader>s"] = { "<cmd>Neoformat<CR>:w<CR>", "save" },

		["{"] = { "<C-u>zz", "half page up" },
		["}"] = { "<C-d>zz", "half page down" },
		["U"] = { "<C-r>", "undo" },
		["n"] = { "nzzzv", "find next and center" },
		["N"] = { "Nzzzv", "find next and center" },
		["gc"] = {
			function()
				require("Comment.api").toggle.linewise.current()
			end,
			"toggle comment",
		},

		["L"] = {
			function()
				require("nvchad.tabufline").tabuflineNext()
			end,
			"goto next buffer",
		},

		["H"] = {
			function()
				require("nvchad.tabufline").tabuflinePrev()
			end,
			"goto prev buffer",
		},

		["<leader>ch"] = { "<cmd> Telescope keymaps <CR>", "Keymap search" },

		["<leader>co"] = { "<cmd> Copilot open <CR>" },
	},
	v = {
		["gc"] = {
			"<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
			"toggle comment",
		},
		["<Tab>"] = { ">" },
		["<S-Tab>"] = { "<" },
	},

	i = {
		["<C-f>"] = {
			function()
				local cmp = require("cmp")
				if cmp.visible() then
					cmp.close()
				else
					cmp.complete()
				end
			end,
		},
		["<Up>"] = {
			function()
				local cmp = require("cmp")
				if cmp.visible() then
					cmp.select_prev_item()
				end
			end,
			"Cycle autocomplete",
		},
		["<Down>"] = {
			function()
				local cmp = require("cmp")
				if cmp.visible() then
					cmp.select_next_item()
				end
			end,
			"Cycle autocomplete",
		},

		["<C-Y>"] = {
			function()
				local cmp = require("cmp")
				if cmp.visible() then
					cmp.select_prev_item()
				end
			end,
			"Cycle autocomplete",
		},
	},
}

-- more keybinds!

return M
