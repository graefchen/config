-- Uses:
-- [1] https://github.com/nanozuki/tabby.nvim
-- [2] https://github.com/nvim-tree/nvim-web-devicons
-- [3] https://github.com/windwp/nvim-autopairs
-- [4] https://github.com/lukas-reineke/indent-blankline.nvim
-- [5] https://github.com/NvChad/nvim-colorizer.lua
-- [6] https://github.com/lewis6991/gitsigns.nvim
return {
	{
		-- A tabline plugin
		"nanozuki/tabby.nvim",
		event = "VimEnter",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			vim.api.nvim_set_keymap("n", "<leader>ta", ":$tabnew<CR>", { noremap = true })
			vim.api.nvim_set_keymap("n", "<leader>tc", ":tabclose<CR>", { noremap = true })
			vim.api.nvim_set_keymap("n", "<leader>to", ":tabonly<CR>", { noremap = true })
			vim.api.nvim_set_keymap("n", "<leader>tn", ":tabn<CR>", { noremap = true })
			vim.api.nvim_set_keymap("n", "<leader>tp", ":tabp<CR>", { noremap = true })
			vim.api.nvim_set_keymap("n", "<leader>tmp", ":-tabmove<CR>", { noremap = true })
			vim.api.nvim_set_keymap("n", "<leader>tmn", ":+tabmove<CR>", { noremap = true })
		end,
	},
	{
		-- creating automatic pairs
		-- of html elements and brackets
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function() end,
	},
	{
		-- This here add indentation lines
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		config = function()
			require("ibl").setup()
		end,
	},
	{
		-- Inline Colorizer
		"NvChad/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({
				filetypes = { "*" },
				user_default_options = {
					css = true,
					mode = "background",
				},
			})
		end,
	},
	{
		-- Shows git signs (if something was added, deleted, changed)
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},
}
