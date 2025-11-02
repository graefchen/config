-- Uses:
-- [1] https://github.com/nvim-telescope/telescope.nvim
-- [2] https://github.com/nvim-lua/plenary.nvim
-- [3] https://github.com/nvim-telescope/telescope-ui-select.nvim
return {{
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {"nvim-lua/plenary.nvim"},
    config = function()
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<C-p>", builtin.find_files, {})
        vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
    end
}, {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
        require("telescope").setup({
            extensions = {
                ["ui-select"] = {require("telescope.themes").get_dropdown({})}
            }
        })
        require("telescope").load_extension("ui-select")
    end
}}
