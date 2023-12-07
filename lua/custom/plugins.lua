local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {
	{
		"sbdchd/neoformat",
		lazy = false,
	},

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
	{
		"nvim-treesitter/nvim-treesitter-context",
		lazy = false,
	},

	-- override plugin configs
	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		lazy = false,
	},
	{
		"numToStr/Comment.nvim",
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},

	{
		"L3MON4D3/LuaSnip",
		config = function()
			require("custom.snippets")
		end,
	},
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},
	{
		"github/copilot.vim",
		lazy = false,
	},
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
	{
		"ThePrimeagen/harpoon",
	},
}

return plugins
