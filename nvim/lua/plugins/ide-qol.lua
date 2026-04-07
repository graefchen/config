return {{
    -- This here add indentation lines
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
        require("ibl").setup()
    end
}, {
    -- Shows git signs (if something was added, deleted, changed)
    "lewis6991/gitsigns.nvim",
    config = function()
        require("gitsigns").setup()
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
    dependencies = {"nvim-lua/plenary.nvim"},
    opts = {}
}}
