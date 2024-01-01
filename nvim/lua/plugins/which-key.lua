-- Uses:
-- [1] https://github.com/folke/which-key.nvim
return {
	"folke/which-key.nvim",
	config = function()
		vim.o.timeout = true
		-- A timeout to not cause problems
		vim.o.timeoutlen = 300
		require("which-key").setup({})
	end,
}
