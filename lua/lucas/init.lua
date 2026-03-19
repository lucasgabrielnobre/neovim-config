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
vim.o.wrap = false;

require("lucas.lazy")
require("lucas.remaps")
require("lucas.code-style")
--require("lucas.colorschemes.gruvbox")
require("lucas.colorschemes.kanagawa")
--require("lucas.colorschemes.tokyonight")
