local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {
	{ "sbdchd/neoformat", lazy = false },

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

	-- override plugin configs
	{ "williamboman/mason.nvim", opts = overrides.mason },
	{ "JoosepAlviste/nvim-ts-context-commentstring", lazy = false },
	{ "numToStr/Comment.nvim" },
	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
		dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
	},
	{ "nvim-tree/nvim-tree.lua", opts = overrides.nvimtree },
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},
	{
		"m4xshen/hardtime.nvim",
		dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			require("hardtime").setup({
				disable_mouse = false,
				disabled_keys = {
					["<Up>"] = {},
					["<Down>"] = {},
					["<Left>"] = {},
					["<Right>"] = {},
				},
				restricted_keys = {
					["w"] = { "n", "x" },
					["b"] = { "n", "x" },
					["h"] = { "n", "x" },
					["j"] = { "n", "x" },
					["k"] = { "n", "x" },
					["l"] = { "n", "x" },
				},
			})
		end,
		event = "BufEnter",
	},
	{
		"ggandor/leap.nvim",
		lazy = false,
		config = function()
			require("leap").add_default_mappings()
		end,
	},
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
