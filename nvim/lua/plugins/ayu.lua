-- Uses:
-- [1] https://github.com/Shatur/neovim-ayu
return {
	"Shatur/neovim-ayu",
	name = "ayu",
	priority = 1000,
	config = function()
		require("ayu").setup({
			overrides = {
				Normal = { bg = "None" },
				ColorColumn = { bg = "None" },
				SignColumn = { bg = "None" },
				Folded = { bg = "None" },
				FoldColumn = { bg = "None" },
				CursorLine = { bg = "None" },
				CursorColumn = { bg = "None" },
				WhichKeyFloat = { bg = "None" },
				VertSplit = { bg = "None" },
			},
		})
		vim.cmd.colorscheme("ayu")
	end,
}
