return {
    "Shatur/neovim-ayu",
    name = "ayu",
    priority = 1000,
    config = function()
        local colors = require('ayu.colors')
        colors.generate()

        require("ayu").setup({
            mirage = false,
            overrides = {
                Normal = { bg = "None" },
                NormalFloat = { bg = "None" },
                SignColumn = { bg = "None" },
                Folded = { bg = "None" },
                FoldColumn = { bg = "None" },
                CursorLine = { bg = "None" },
                CursorColumn = { bg = "None" },
                VertSplit = { bg = "None" },
                Comment = { italic = false },
                LineNr = { bg = "None" }
            },
        })
        require("ayu").colorscheme()
    end
}
