-- Uses:
-- [1] https://github.com/nvim-lualine/lualine.nvim
-- [2] https://github.com/nvim-tree/nvim-web-devicons
return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup({
            options = { theme = "ayu" }
        })
    end
}
