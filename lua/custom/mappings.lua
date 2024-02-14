-- {{{ Disabled Mappings

---@type MappingsTable
local M = {}

M.disabled = {

	-- ---------------------------------------------------------------------------------- }}}
	-- {{{ Normal

	n = {
		["<leader>n"] = { "" },
		["<tab>"] = { "" },
		["<S-tab>"] = { "" },
	},
}
-- -------------------------------------------------------------------------------- }}}
-- {{{ Enabled Mappings

M.general = {

	-- -------------------------------------------------------------------------------- }}}
	-- {{{ Normal Mappings
	n = {

		["<leader>fn"] = {
			"^<cmd>lua require('Comment.api').toggle.linewise.current()<cr>0ea {{{<esc>A<cr><cr><cr><cr>-------------------------------------------------------------------------- }}}<esc><cmd>lua require('Comment.api').toggle.linewise.current()<cr>kka",
			"Create a new fold with this line as the title",
		},

		["ma"] = { "zMzz", "close all folds and center" },
		["mr"] = { "zR", "Open all folds" },
		["mi"] = { "za", "toggle current fold" },
		["mj"] = { "zcjzOzz", "close current fold when open. Always open next fold." },
		["mk"] = { "zckzOzz", " close current fold when open. Always open previous fould." },

		["<leader><leader>j"] = { "<cmd>wincmd j<CR>", "move to pane below" },
		["<leader><leader>k"] = { "<cmd>wincmd k<CR>", "move to pane above" },

		["<leader><leader>e"] = { "oif err != nil {<CR>}<Esc>Oreturn err <Esc>", "if err != nil" },
		["<leader><leader>t"] = { "<cmd> TroubleToggle<CR>", "trouble" },
		["Q"] = { "@q", "run macro q" },
		["<C-q>"] = {
			function(bufnr)
				require("telescope.actions").smart_send_to_qflist(bufnr)
				require("telescope.builtin").quickfix()
			end,
			"Send to quickfix",
		},
		["<leader>q"] = { "<cmd>q<CR>", "close buffer" },
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

		["<Esc>"] = { ":noh<CR>", "clear highlights" },
		["<leader><leader>s"] = { ":w<CR>", "save" },
		["<leader>s"] = { "<cmd>Neoformat<CR>:w<CR>", "save" },

		["{"] = { "<C-u>zz", "half page up" },
		["}"] = { "<C-d>zz", "half page down" },
		["U"] = { "<C-r>", "undo" },
		["n"] = { "nzzzv", "find next and center" },
		["N"] = { "Nzzzv", "find next and center" },

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

	-- ---------------------------------------------------------------------------------- }}}
	-- {{{ Visual Mappings

	v = {
		["gc"] = {
			function()
				require("Comment.api").toggle.linewise.current()
			end,
			"toggle comment",
			{ silent = true, noremap = true },
		},
		["<Tab>"] = { ">" },
		["<S-Tab>"] = { "<" },
		["<leader>fs"] = {
			"c-------------------------------------------------------------------------- }}}<esc>:lua require('Comment.api').toggle.linewise.current()<cr>O<esc>O<esc>pO<esc>O{{{<esc>:lua require('Comment.api').toggle.linewise.current()<cr>A ",
			"Create fold around selected text",
		},
	},
	-- ---------------------------------------------------------------------------------- }}}
	-- {{{ Insert Mappings

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
	},
}
return M
-- -------------------------------------------------------------------------------- }}}
