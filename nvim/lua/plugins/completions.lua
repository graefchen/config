-- The whole snippets engine thing is way to complicated to explain
-- maybe I am going to write a little bit about it later ...
-- Uses:
-- [1] https://github.com/hrsh7th/cmp-nvim-lsp
-- [2] https://github.com/hrsh7th/cmp-nvim-lsp-signature-help
-- [3] https://github.com/L3MON4D3/LuaSnip
-- [4] https://github.com/saadparwaiz1/cmp_luasnip
-- [5] https://github.com/rafamadriz/friendly-snippets
-- [6] https://github.com/hrsh7th/nvim-cmp
return {
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"hrsh7th/cmp-nvim-lsp-signature-help",
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")
			-- using existing vscode snippets in nvim
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					-- The function signarure
					-- { name = "nvim_lsp_signature_help" },
				}, {
					{ name = "buffer" },
				}),
			})
		end,
	},
}
