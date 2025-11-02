-- Uses:
-- [1] https://github.com/goolord/alpha-nvim
-- [2] https://github.com/nvim-tree/nvim-web-devicons
-- Examples for help:
-- [1] https://github.com/cpow/neovim-for-newbs/blob/819b1528f1b2d29e253d033c768553abf40e52a8/lua/plugins/alpha.lua
-- [2] https://github.com/sho-87/dotfiles/blob/master/nvim/lua/plugins/modules/alpha.lua
return {
    "goolord/alpha-nvim",
    dependencies = {"nvim-tree/nvim-web-devicons"},

    config = function()
        local alpha = require("alpha")
        -- Possible themes to use:
        -- [1] startify
        -- [2] theta
        -- [3] dashboard
        local theme = require("alpha.themes.theta")
        -- fortune printing ...
        -- need to look how to implement in a good way with the layout
        -- local fortune = require("alpha.fortune")

        alpha.setup(theme.config)
    end
}
