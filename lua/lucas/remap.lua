vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>b", function()
  local build_path = "code\\build.bat"
  if vim.fn.filereadable(build_path) == 1 then
    vim.cmd("terminal cmd /c " .. build_path)
  else
    print("build.bat não encontrado!")
  end
end)
vim.keymap.set("n", "<leader>e", function()
    vim.cmd("terminal cmd /c devenv build\\win32_handmade.exe") 
end)

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>pg', builtin.live_grep, { desc = 'Telescope live grep' })
