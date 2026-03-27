vim.g.mapleader = " "
vim.keymap.set("n", "<leader>v", "<cmd>NvimTreeToggle<CR>")

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', function() require('telescope.builtin').find_files() end)
vim.keymap.set('n', '<C-p>',      function() require('telescope.builtin').git_files() end)
vim.keymap.set('n', '<leader>ps', function()
    require('telescope.builtin').grep_string({ search = vim.fn.input("Grep > ") })
end)

vim.keymap.set('n', '<leader>n', function()
  vim.o.number = not vim.o.number
  vim.wo.relativenumber = not vim.wo.relativenumber
end)
vim.keymap.set('n', '<C-n>', function()
  vim.o.number = not vim.o.number
  vim.wo.relativenumber = not vim.wo.relativenumber
end)

vim.keymap.set('n', '<C-a>', ':%y+<CR>', { noremap = true, silent = true, desc = 'Copy Entire File' })

vim.keymap.set("n", "<F5>", function()
  vim.cmd("w")

  local ft = vim.bo.filetype
  local cmd = ""

  if ft == "cpp" then
    cmd = "g++ -std=c++17 -Wall -O2 % -o %:r && ./%:r"
  elseif ft == "python" then
    cmd = "python3 %"
  else
    print("Filetype não suportado: " .. ft)
    return
  end

  vim.cmd("botright vs | terminal " .. cmd)
end)

--[[
vim.keymap.set("n", "<F8>", function()
  local dap = require("dap")

  -- salva arquivo
  vim.cmd("w")

  -- nome do executável
  local exe = vim.fn.expand("%:r")

  -- compila com debug
  local cmd = string.format("g++ -std=c++17 -g %s -o %s", vim.fn.expand("%"), exe)
  local result = os.execute(cmd)

  if result ~= 0 then
    print("Erro na compilação!")
    return
  end

  -- inicia debug direto no executável
  dap.run({
    type = "cppdbg",
    request = "launch",
    name = "Debug current file",
    program = vim.fn.getcwd() .. "/" .. exe,
    cwd = "${workspaceFolder}",
    stopAtEntry = true,
  })
end)
--]]
vim.keymap.set("n", "<F8>", function()
  local dap = require("dap")

  -- salva arquivo
  vim.cmd("w")

  -- nome do executável
  local exe = vim.fn.expand("%:r")
  local exe_path = vim.fn.getcwd() .. "/" .. exe

  -- compila com debug (melhor para debug: -O0)
  local cmd = string.format("g++ -std=c++17 -g -O0 %s -o %s", vim.fn.expand("%"), exe)
  local result = os.execute(cmd)

  if result ~= 0 then
    print("Erro na compilação!")
    return
  end

  -- inicia debug com codelldb
  dap.run({
    type = "codelldb", 
    request = "launch",
    name = "Debug current file (codelldb)",
    program = exe_path,
    cwd = vim.fn.getcwd(),
    stopAtEntry = true,
    console = "integratedTerminal", 
  })
end)
vim.keymap.set("v", "<C-c>", '"+y', { noremap = true, silent = true })
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])
