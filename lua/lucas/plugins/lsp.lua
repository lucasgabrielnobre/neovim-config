return {
    {
    "neovim/nvim-lspconfig",
    config = function()
        vim.lsp.enable("clangd")
         vim.diagnostic.config({
                virtual_text = false, 
                signs = false, 
                underline = false, 
            })

            -- Mapping para mostrar diagnósticos manualmente
            vim.keymap.set("n", "<C-t>", vim.diagnostic.open_float)
             local diagnostics_enabled = false
            vim.keymap.set("n", "<C-e>", function()
                diagnostics_enabled = not diagnostics_enabled
                vim.diagnostic.config({
                    virtual_text = false,               -- Texto de aviso depois da linha
                    signs        = diagnostics_enabled,  -- E para erro no começo da linha
                    underline    = diagnostics_enabled, -- underline vermelho para os erros
                })
            end)
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                completion = {
                    autocomplete = false,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-h>"] = cmp.mapping.complete(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["j"] = cmp.mapping.select_next_item(),
                    ["k"] = cmp.mapping.select_prev_item(),
                    ["<Down>"] = cmp.mapping.select_next_item(),
                    ["<Up>"] = cmp.mapping.select_prev_item(),
                }),
                sources = {
                    { name = "nvim_lsp" },
                },
            })
        end,
    },
}
