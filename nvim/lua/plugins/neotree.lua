-- Uses:
-- [1] https://github.com/nvim-neo-tree/neo-tree.nvim
-- [2] https://github.com/nvim-lua/plenary.nvim
-- [3] https://github.com/nvim-tree/nvim-web-devicons
-- [4] https://github.com/MunifTanjim/nui.nvim
return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim" },
    config = function()
        require("neo-tree").setup({
            close_if_last_window = true,
            popup_border_style = "rounded",
            enable_git_status = true,
            enable_diagnostics = true,
            window = {
                position = "float"
            },
            filesystem = {
                filtered_items = {
                    visible = true,
                    hide_dotfiles = false,
                    hide_gitignore = false,
                    hide_hidden = true, -- only on Windows
                    never_show = { ".git", ".jj", "node_modules" },
                }
            }
        })

        -- Todo: Maybe put this in another place...
        vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal<CR>")

        -- Here come all the dev icon changes...
        require("nvim-web-devicons").setup({
            override_by_extension = {
                -- TOML Reference
                -- https://github.com/nvim-tree/nvim-web-devicons/blob/cff25ce621e6d15fae0b0bfe38c00be50ce38468/lua/nvim-web-devicons/icons-default.lua#L1703-L1708
                ["toml"] = {
                    icon = "",
                }
            }
        })
    end
}
