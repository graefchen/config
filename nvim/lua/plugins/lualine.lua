-- Uses:
-- [1] https://github.com/nvim-lualine/lualine.nvim
-- [2] https://github.com/nvim-tree/nvim-web-devicons
return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local ayu_theme = "ayu-light"
		if vim.o.background == "dark" then
			ayu_theme = "ayu-dark"
		end
		require("tabby.tabline").use_preset("tab_only", { theme = nil, nerdfont = true, lualine_theme = ayu_theme })
	end,
}
