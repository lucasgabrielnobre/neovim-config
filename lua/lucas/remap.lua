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

vim.keymap.set('n', '<C-a>', ':%y+<CR>', { noremap = true, silent = true, desc = 'Copy Entire File' })

vim.keymap.set("n", "<F7>", ":!g++ -std=c++17 -Wall -O2 % -o %:r<CR>", { silent = true })
vim.keymap.set("n", "<F2>", ":vs | terminal ./%:r<CR>", { silent = true })
vim.keymap.set("n", "<F5>", function()
  vim.cmd("w")
  vim.cmd("split | terminal g++ -std=c++17 -Wall -O2 % -o %:r && ./%:r")
end)
