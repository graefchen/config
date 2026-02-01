return {
	"folke/zen-mode.nvim",
	opts = {},
	config = function()
		vim.keymap.set('n', '<C-z>', ':ZenMode<CR>')
	end
}
