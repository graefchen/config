-- Uses:
-- [1] https://github.com/williamboman/mason.nvim
-- [2] https://github.com/williamboman/mason-lspconfig.nvim
-- [3] https://github.com/neovim/nvim-lspconfig
return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				ui = { border = "rounded" },
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				-- Making sure that those LSP's are 100% installed
				-- List of possible extenions here: https://mason-registry.dev/registry/list
				-- And the names of the extensions: https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers
				-- Todo: Add HTML Server
				ensure_installed = {
					-- biome (json, js, ts)
					"biome",
					-- clangd(c, c++)
					"clangd",
					-- cssls (css, scss, less)
					"cssls",
					-- denols (js, ts)
					"denols",
					-- html (html)
					"html",
					-- hls (haskell)
					"hls",
					-- lua_ls (lua)
					"lua_ls",
					-- rust_analyzer (rust)
					"rust_analyzer",
					-- tailwindcss (css) [specifically for tailwind classes]
					"tailwindcss",
					-- taplo (toml)
					"taplo",
					-- tsserver (js, ts)
					"tsserver",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			-- setting up the lsp with all the needed capabilities
			-- Todo: Make that even better ... somehow
			lspconfig.clangd.setup({
				capabilities = capabilities,
			})
			lspconfig.cssls.setup({
				capabilities = capabilities,
			})
			lspconfig.denols.setup({
				capabilities = capabilities,
			})
			lspconfig.html.setup({
				capabilities = capabilities,
			})
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
			})
			lspconfig.tailwindcss.setup({
				capabilities = capabilities,
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
