vim.g.mapleader = " "
vim.keymap.set("n", "<leader>v", "<cmd>NvimTreeToggle<CR>")

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ")})
end)

vim.keymap.set('n', '<leader>n', function()
  vim.o.number = not vim.o.number
end)

vim.keymap.set('n', '<C-n>', function()
  vim.wo.relativenumber = not vim.wo.relativenumber
end)
