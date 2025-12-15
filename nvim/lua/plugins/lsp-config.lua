return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
                ui = { border = "rounded" },
            })
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            -- List of possible extenions here: https://mason-registry.dev/registry/list
            require("mason-lspconfig").setup({})
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- TODO: Change some thing 'ere so it automatically does lsp things...
            -- vim.lsp.enable("clangd", { capabilities = capabilities })

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
        end,
    },
    {
        "ray-x/lsp_signature.nvim",
        config = function()
            require("lsp_signature").setup({
                hint_enable = false,
            })
        end,
    },
}
