return {
    "Shatur/neovim-ayu",
    name = "ayu",
    priority = 1000,
    config = function()
        local colors = require('ayu.colors')

        require("ayu").setup({
            mirage = false,
            overrides = {
                Normal = { bg = "None" },
                NormalFloat = { bg = "none" },
                ColorColumn = { bg = "None" },
                SignColumn = { bg = "None" },
                Folded = { bg = "None" },
                FoldColumn = { bg = "None" },
                CursorLine = { bg = "None" },
                CursorColumn = { bg = "None" },
                VertSplit = { bg = "None" },
                Comment = { italic = false },
                LineNr = { fg = colors.accent }
            },
        })
        require("ayu").colorscheme()
    end
}
