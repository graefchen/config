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
    dependencies = {"nvim-tree/nvim-web-devicons"},
    config = function()
        local alpha = require("alpha")
        local theme = require("alpha.themes.theta")
        alpha.setup(theme.config)
    end
}
