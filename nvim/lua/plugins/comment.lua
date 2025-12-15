-- Uses:
-- [1] https://github.com/terrortylor/nvim-comment
return { {
    -- An plugin that helps with commenting multiple lines of code ... very very practical
    "numToStr/Comment.nvim",
    lazy = false,
    config = function()
        require("Comment").setup({
            -- Setting cmd and the "#"" key (german keyboard) to comment line(s)
            toggler = { line = "<C-\\>" },
            opleader = { line = "<C-\\>" }
        })
    end
} }
