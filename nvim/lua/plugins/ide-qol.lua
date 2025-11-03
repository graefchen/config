return { {
    -- A tabline plugin
    "nanozuki/tabby.nvim",
    event = "VimEnter",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        -- seting up tabby
        require("tabby.tabline").use_preset("tab_only", {
            theme = nil,
            nerdfont = true,
            lualine_theme = "ayu-dark"
        })

        -- shortcuts
        vim.keymap.set("n", "<leader>ta", ":$tabnew<CR>")
        vim.keymap.set("n", "<leader>tc", ":tabclose<CR>")
        vim.keymap.set("n", "<leader>to", ":tabonly<CR>")
        vim.keymap.set("n", "<leader>tn", ":tabn<CR>")
        vim.keymap.set("n", "<leader>tp", ":tabp<CR>")
    end
}, {
    -- creating automatic pairs
    -- of html elements and brackets
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
        require("nvim-autopairs").setup({})
    end
}, {
    -- This here add indentation lines
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
        require("ibl").setup()
    end
}, {
    -- Inline Colorizer
    "NvChad/nvim-colorizer.lua",
    config = function()
        require("colorizer").setup({
            filetypes = { "*" },
            user_default_options = {
                css = true,
                mode = "background"
            }
        })
    end
}, {
    -- Shows git signs (if something was added, deleted, changed)
    "lewis6991/gitsigns.nvim",
    config = function()
        require("gitsigns").setup()
    end
}, {
    "windwp/nvim-ts-autotag",
    config = function()
        require("nvim-treesitter.configs").setup({
            autotag = { enable = true }
        })
    end
}, {
    "fedepujol/move.nvim",
    config = function()
        require("move").setup({})
        vim.keymap.set('n', '<C-Down>', ':MoveLine(1)<CR>')
        vim.keymap.set('n', '<C-Up>', ':MoveLine(-1)<CR>')
        vim.keymap.set('v', '<A-j>', ':MoveBlock(1)<CR>')
        vim.keymap.set('v', '<A-k>', ':MoveBlock(-1)<CR>')
    end
}, {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {}
} }
