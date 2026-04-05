vim.cmd.colorscheme("gruber-darker")

local function matchparen_gray()
  vim.api.nvim_set_hl(0, "MatchParen", {
    bg = "#3a3a3a", -- cinza suave
    fg = "#e4e4ef", -- texto claro 
    bold = true,    -- opcional
  })
  vim.api.nvim_set_hl(0, "Comment", {
    fg = "#73c936",
    italic = false,
  })
  vim.api.nvim_set_hl(0, "String", {
    fg = "#cc8c3c",
    italic = false,
  })
  vim.api.nvim_set_hl(0, "Character", {
    fg = "#cc8c3c", 
    italic = false,
  })
end

matchparen_gray()

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = matchparen_gray,
})
