vim.opt.autochdir = true

vim.api.nvim_create_autocmd("TermOpen", {
  callback = function()
    vim.cmd("startinsert")
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*.cpp",
    callback = function()
        if vim.fn.line("$") == 1 and vim.fn.getline(1) == "" then
            vim.cmd("0r ~/.config/nvim/templates/cpp.cpp")
        end
    end
})
vim.opt.showmode = false
vim.opt.cmdheight = 0
vim.opt.laststatus = 0
vim.o.wrap = false;

vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99 -- Começa com tudo expandido

require("lucas.lazy")
require("lucas.remaps")
require("lucas.code-style")

require("lucas.colorschemes.gruber-darker")
--require("lucas.colorschemes.gruvbox")
--require("lucas.colorschemes.kanagawa")
--require("lucas.colorschemes.tokyonight")

--vim.cmd[[colorscheme zenbones]]


--[[
vim.cmd("colorscheme habamax")
vim.api.nvim_set_hl(0, "StatusLine", { bg = "#1c1c1c", fg = "#a8a8a8" })
vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#1c1c1c", fg = "#5f5f5f" })
vim.opt.laststatus = 0
--]]
