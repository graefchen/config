-- Some layouts i really like:
-- https://github.com/goolord/alpha-nvim/discussions/16#discussioncomment-2611895
-- https://github.com/goolord/alpha-nvim/discussions/16#discussioncomment-3099041
-- https://github.com/goolord/alpha-nvim/discussions/16#discussioncomment-10234780
-- https://github.com/goolord/alpha-nvim/discussions/16#discussioncomment-11059908
-- https://github.com/goolord/alpha-nvim/discussions/16#discussioncomment-11352453
-- https://github.com/goolord/alpha-nvim/discussions/16#discussioncomment-11876081
-- https://github.com/goolord/alpha-nvim/discussions/16#discussioncomment-14132688
-- Some smol fixes:
-- https://github.com/goolord/alpha-nvim/discussions/16#discussioncomment-3337303
return {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local alpha = require("alpha")
        local theta = require("alpha.themes.theta")
        local dashboard = require("alpha.themes.dashboard")
        -- theta.header.val = {
        --     [[Cherry blossoms —]],
        --     [[lights           ]],
        --     [[of years past.   ]],
        --     [[                 ]],
        --     [[   — Matsuo Bashō]],
        -- }
        theta.header.type = "group"
        theta.header.val = require("haikus")
        theta.header.opts = { width = 50 }
        theta.buttons.val = {
            { type = "text",    val = "Quick links", opts = { hl = "SpecialComment", position = "center" } },
            { type = "padding", val = 1 },
            dashboard.button("e", "  New file", "<cmd>ene<CR>"),
            dashboard.button("<C-n>", "󰙅  Neotree"),
            dashboard.button("<C-p>", "  File preview"),
            dashboard.button("SPC f f", "󰈞  Find file"),
            dashboard.button("SPC f g", "󰊄  Live grep"),
            dashboard.button("U", "  Update LSP via Mason", "<cmd>MasonUpdate<CR>"),
            dashboard.button("u", "  Update plugins", "<cmd>Lazy sync<CR>"),
            dashboard.button("q", "󰅚  Quit", "<cmd>qa<CR>"),
        }
        alpha.setup(theta.config)
        vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
    end
}
