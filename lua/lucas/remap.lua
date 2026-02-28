vim.g.mapleader = " "
vim.keymap.set("n", "<leader>v", vim.cmd.Ex)
vim.keymap.set("n", "<leader>hb", function()
  local build_path = "code\\build.bat"
  if vim.fn.filereadable(build_path) == 1 then
    vim.cmd("terminal cmd /c " .. build_path)
  else
    print("build.bat não encontrado!")
  end
end)
vim.keymap.set("n", "<leader>hv", function()
    vim.cmd("terminal cmd /c devenv build\\win32_handmade.exe") 
end)

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ")})
end)
vim.keymap.set('n', '<leader>n', function()
    vim.o.number = not vim.o.number
end)
