-- Uses:
-- [1] https://github.com/nvimtools/none-ls.nvim
-- [2] https://github.com/terrortylor/nvim-comment
return {
	{
		"nvimtools/none-ls.nvim",
		config = function()
			local null_ls = require("null-ls")
			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

			null_ls.setup({
				-- The formater we use
				sources = {
					-- lua formatter
					null_ls.builtins.formatting.stylua,
				},
				-- Attaching an function that fromats every time a file gets saved
				on_attach = function(client, bufnr)
					if client.supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({ async = false })
							end,
						})
					end
				end,
			})

			-- adding key shortcut to format files
			vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
		end,
	},
	{
		-- An plugin that helps with commenting multiple lines of code ... very very practical
		"numToStr/Comment.nvim",
		lazy = false,
		config = function()
			-- setting up Comment
			require("Comment").setup()
		end,
	},
}
