-- Uses:
-- [1] https://github.com/goolord/alpha-nvim
-- [2] https://github.com/nvim-tree/nvim-web-devicons
return {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local alpha = require("alpha")
        local theta = require("alpha.themes.theta")
        local dashboard = require("alpha.themes.dashboard")
        theta.header.val = {
            [[ Cherry blossoms — ]],
            [[ lights            ]],
            [[ of years past.    ]],
            [[                   ]],
            [[    — Matsuo Bashō ]],
        }
        theta.header.opts = { position = "center", hl = "String" }
        theta.buttons.type = "group"
        theta.buttons.val = {
            { type = "text",    val = "Quick links", opts = { hl = "SpecialComment", position = "center" } },
            { type = "padding", val = 1 },
            dashboard.button("e", "New file", "<cmd>ene<CR>"),
            dashboard.button("<C-n>", "Neotree"),
            dashboard.button("<C-p>", "File preview"),
            dashboard.button("SPC f f", "Find file"),
            dashboard.button("SPC f g", "Live grep"),
            dashboard.button("u", "Update plugins", "<cmd>Lazy sync<CR>"),
            dashboard.button("q", "Quit", "<cmd>qa<CR>"),
        }
        theta.buttons.position = "center"
        alpha.setup(theta.config)
        vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
    end
}
