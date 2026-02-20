return {
    {
	"neovim/nvim-lspconfig",
	config = function()
	    vim.lsp.enable("clangd")
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
		    autocomplete = false,  -- desativa o menu automático
		},
		mapping = cmp.mapping.preset.insert({
		    ["<Tab>"] = cmp.mapping.complete(),
		    ["<CR>"] = cmp.mapping.confirm({ select = true }),
		    ["j"] = cmp.mapping.select_next_item(),
		    ["k"] = cmp.mapping.select_prev_item(),
		    ["<Down>"] = cmp.mapping.select_next_item(),
		    ["<Up>"] = cmp.mapping.select_prev_item(),
		}),
		sources = {
		    { name = "nvim_lsp" },
		},
	    })	end,
	},
    } 
