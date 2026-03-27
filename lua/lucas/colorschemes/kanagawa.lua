-- Default options:
require('kanagawa').setup({
    compile = false,             -- enable compiling the colorscheme
    undercurl = true,            -- enable undercurls
    commentStyle = { italic = false },
    functionStyle = {},
    keywordStyle = { italic = false },
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = false,         -- do not set background color
    dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
    terminalColors = true,       -- define vim.g.terminal_color_{0,17}
    colors = 
    {                   -- add/modify theme and palette colors
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
    },
    overrides = function(colors)
        local palette = colors.palette
        return {
            LineNr = { bg = "none" },
            CursorLineNr = { bg = "none" },
            ["@punctuation.bracket"] = { link = "Normal" },
            ["@punctuation.bracket.cpp"] = { link = "Normal" },
            RainbowDelimiterRed    = { fg = palette.samuraiRed },
            RainbowDelimiterYellow = { fg = palette.carpYellow },
            RainbowDelimiterBlue   = { fg = palette.crystalBlue },
            RainbowDelimiterOrange = { fg = palette.surimiOrange },
            RainbowDelimiterGreen  = { fg = palette.springGreen },
            RainbowDelimiterViolet = { fg = palette.oniViolet },
            RainbowDelimiterCyan   = { fg = palette.waveAqua1 },
        }
    end,
    theme = "wave",              -- Load "wave" theme
    background = 
    {               -- map the value of 'background' option to a theme
        dark = "wave",           -- try "dragon" !
        light = "lotus"
    },
})

-- setup must be called before loading
vim.cmd("colorscheme kanagawa")
