-- Uses:
-- [1] https://github.com/nvim-treesitter/nvim-treesitter
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			-- ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "html" },
			-- Automatically installing all treesitters from files that get opened
			auto_install = true,
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
