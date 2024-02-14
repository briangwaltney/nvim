local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {
	{ "sbdchd/neoformat", lazy = false },
	{ "TamaMcGlinn/quickfixdd", lazy = false },

	-- Override plugin definition options
	{
		"NvChad/nvim-colorizer.lua",
		opts = {
			user_default_options = {
				tailwind = true,
				mode = "background",
				names = false,
			},
		},
	},
	{
		"anuvyklack/pretty-fold.nvim",
		lazy = false,
		config = function()
			require("pretty-fold").setup({
				fill_char = " ",
				keep_indentation = true,
				sections = {
					left = {
						"content",
					},
					right = {
						"",
						function(config)
							return config.fill_char:rep(3)
						end,
					},
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- format & linting
			{
				"jose-elias-alvarez/null-ls.nvim",
				config = function()
					require("custom.configs.null-ls")
				end,
			},
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end, -- Override to setup mason-lspconfig
	},
	{ "nvim-treesitter/nvim-treesitter-context", lazy = false },
	{ "williamboman/mason.nvim", opts = overrides.mason },
	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},
	{ "nvim-tree/nvim-tree.lua", opts = overrides.nvimtree },
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},
	{ "imsnif/kdl.vim", ft = "kdl" },
	{ "github/copilot.vim", lazy = false },
	{
		"hrsh7th/nvim-cmp",
		opts = {
			completion = { completeopt = "menu,menuone,noinsert,noselect" },
			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "nvim_lua" },
				{ name = "path" },
			},
			mapping = {
				["<Tab>"] = require("cmp").config.disable,
				["<S-Tab>"] = require("cmp").config.disable,
				["<CR>"] = require("cmp").mapping.confirm({
					behavior = require("cmp").ConfirmBehavior.Insert,
					select = false,
				}),
			},
		},
	},
	{ "folke/trouble.nvim", dependencies = { "nvim-tree/nvim-web-devicons" }, lazy = false },
}

return plugins
