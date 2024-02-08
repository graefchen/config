-- Uses:
-- [1] https://github.com/nanozuki/tabby.nvim
-- [2] https://github.com/nvim-tree/nvim-web-devicons
-- [3] https://github.com/windwp/nvim-autopairs
-- [4] https://github.com/lukas-reineke/indent-blankline.nvim
-- [5] https://github.com/NvChad/nvim-colorizer.lua
-- [6] https://github.com/lewis6991/gitsigns.nvim
-- [7] https://github.com/windwp/nvim-ts-autotag
return {
	{
		-- A tabline plugin
		"nanozuki/tabby.nvim",
		event = "VimEnter",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			local ayu_theme = "ayu-light"
			if vim.o.background == "dark" then
				ayu_theme = "ayu-dark"
			end
			-- seting up tabby
			require("tabby.tabline").use_preset("tab_only", { theme = nil, nerdfont = true, lualine_theme = ayu_theme })

			-- shortcuts
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
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},
	{
		-- This here add indentation lines
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		config = function()
			local highlight = {
				"RainbowRed",
				"RainbowYellow",
				"RainbowBlue",
				"RainbowOrange",
				"RainbowGreen",
				"RainbowViolet",
				"RainbowCyan",
			}

			local hooks = require("ibl.hooks")
			-- create the highlight groups in the highlight setup hook, so they are reset
			-- every time the colorscheme changes
			hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
				vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
				vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
				vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
				vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
				vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
				vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
				vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
			end)

			require("ibl").setup({ indent = { highlight = highlight } })
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
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-treesitter.configs").setup({
				autotag = {
					enable = true,
				},
			})
		end,
	},
}
