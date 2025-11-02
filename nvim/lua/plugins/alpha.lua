-- Uses:
-- [1] https://github.com/goolord/alpha-nvim
-- [2] https://github.com/nvim-tree/nvim-web-devicons
return {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local alpha = require("alpha")
        local fortune = require("alpha.fortune")
        local dashboard = require("alpha.themes.dashboard")
        -- TODO: Switch out with Haiku
        dashboard.section.footer.val = fortune()
        alpha.setup(dashboard.opts)
    end
}
