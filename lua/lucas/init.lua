vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.cmd("lcd %:p:h")
  end
})
vim.api.nvim_create_autocmd("TermOpen", {
  callback = function()
    vim.cmd("startinsert")
  end,
})
require("lucas.lazy")
require("lucas.remap")
require("lucas.code-style")
--require("lucas.colorschemes.grubbox")
require("lucas.colorschemes.kanagawa")
