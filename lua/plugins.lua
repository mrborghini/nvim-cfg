-- plugins.lua

return {
	-- LSP
	{ "neovim/nvim-lspconfig" },          -- LSP config
	{ "williamboman/mason.nvim" },        -- Mason handles LSP installation
	{ "williamboman/mason-lspconfig.nvim" }, -- Integration between Mason and LSPConfig

	-- Autocomplete
	{ "hrsh7th/nvim-cmp" },      -- Completion engine
	{ "hrsh7th/cmp-nvim-lsp" },  -- LSP source for nvim-cmp
	{ "hrsh7th/cmp-buffer" },    -- Buffer completions
	{ "hrsh7th/cmp-path" },      -- Path completions
	{ "hrsh7th/cmp-cmdline" },   -- Cmdline completions
	{ "saadparwaiz1/cmp_luasnip" }, -- Snippet completions
	{ "L3MON4D3/LuaSnip" },      -- Snippet engine

	-- UI navigation
	{ "nvim-tree/nvim-tree.lua" },

	-- Themes
	{ "olimorris/onedarkpro.nvim" },

	-- Misc
	{
		'vyfor/cord.nvim',
		build = './build || .\\build',
		event = 'VeryLazy',
		opts = {}, -- calls require('cord').setup()
	}
}
