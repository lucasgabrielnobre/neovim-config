return {
{
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    tag = "v0.9.3",
    config = function()
        require('nvim-treesitter.configs').setup {
            ensure_installed = { 'cpp', 'python', 'lua' },
            highlight = {
                enable = true,
            },
        }
    end
},

{
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "thehamsta/nvim-dap-virtual-text",
        "nvim-neotest/nvim-nio",
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        dapui.setup()
        require("nvim-dap-virtual-text").setup()

        --  Adapter C++ (usando GDB)
	--[[
        dap.adapters.cppdbg = {
            id = "cppdbg",
            type = "executable",
            command = "gdb",
            args = { "--interpreter=dap", "--quiet" }
        }
        
	--]]
        dap.adapters.codelldb = {
            type = "server",
            port = "${port}",
            executable = {
                command = "codelldb",
                args = {"--port", "${port}"},
            }
        }
	
        dap.configurations.cpp = {
            {
                name = "Debug C++ (codelldb)",
                type = "codelldb",
                request = "launch",
                program = function()
                    return vim.fn.input('Path do executável: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = "${workspaceFolder}",
                stopAtEntry = true,
                console = "integratedTerminal",
            },
        }
        --[[
        --  Configuração de debug
        dap.configurations.cpp = {
            {
                name = "Debug C++ (GDB)",
                type = "cppdbg",
                request = "launch",
                program = function()
                    return vim.fn.input('Path do executável: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = "${workspaceFolder}",
                stopAtEntry = true,
                args = {},
                runInTerminal = true,
            },
        }
        --]]

        -- C usa a mesma config
        dap.configurations.c = dap.configurations.cpp

        --  Keymaps
        vim.keymap.set("n", "<space>b", dap.toggle_breakpoint)
        vim.keymap.set("n", "<space>gb", dap.run_to_cursor)
        vim.keymap.set("n", "<space>dc", dap.continue)
        vim.keymap.set("n", "<space>di", dap.step_into)
        vim.keymap.set("n", "<space>do", dap.step_over)
        vim.keymap.set("n", "<space>dO", dap.step_out)
        vim.keymap.set("n", "<space>dr", dap.repl.open)
        vim.keymap.set("n", "<space>dl", dap.run_last)

        --  Abrir/fechar UI automaticamente
        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
        end
    end,
},
{
    "williamboman/mason.nvim",
    config = function()
        require("mason").setup()
    end
},
{ "nvim-lua/plenary.nvim" },

{ "nvim-telescope/telescope.nvim", version = '*' },
{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
{ "rebelot/kanagawa.nvim" },
{ "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = {}}, 
{
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true,
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) 
},
{
    "zenbones-theme/zenbones.nvim",
    -- Optionally install Lush. Allows for more configuration or extending the colorscheme
    -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
    -- In Vim, compat mode is turned on as Lush only works in Neovim.
    dependencies = "rktjmp/lush.nvim",
    lazy = false,
    priority = 1000,
    -- you can set set configuration options here
    -- config = function()
    --     vim.g.zenbones_darken_comments = 45
    --     vim.cmd.colorscheme('zenbones')
    -- end
},
{
  "blazkowolf/gruber-darker.nvim",
  opts = {
    bold = true,
    italic = {
      strings = false,
    },
  },
},
{
    "okuuva/auto-save.nvim",
    version = '*', -- see https://devhints.io/semver, alternatively use '*' to use the latest tagged release
    cmd = "ASToggle", -- optional for lazy loading on command
    event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
    opts = {
        -- your config goes here
        -- or just leave it empty :)
    },
},
{
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup 
        {
            actions = {
                open_file = {
                    quit_on_open = true,
                },
            },
        }
        local api = require("nvim-tree.api")
        local Event = api.events.Event

        api.events.subscribe(Event.FileCreated, function(file)
          vim.cmd("edit " .. vim.fn.fnameescape(file.fname))
        end)
    end,
},
--[[
{
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('lualine').setup 
        {
            options = {
                icons_enabled = true,
                theme = 'auto',
                component_separators = { left = '', right = ''},
                section_separators = { left = '', right = ''},
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                always_show_tabline = true,
                globalstatus = false,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                    refresh_time = 16, -- ~60fps
                    events = {
                        'WinEnter',
                        'BufEnter',
                        'BufWritePost',
                        'SessionLoadPost',
                        'FileChangedShellPost',
                        'VimResized',
                        'Filetype',
                        'CursorMoved',
                        'CursorMovedI',
                        'ModeChanged',
                    },
                }
            },
            sections = {
                lualine_a = {'mode'},
                lualine_b = {},
                lualine_c = {
                    {'filename', cond = function() return vim.bo.filetype ~= "NvimTree" end}
                },
                lualine_x = {},
                lualine_y = {},
                lualine_z = {
                    {'location', cond = function() return vim.bo.filetype ~= "NvimTree" end}
                }
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {
                    {'filename', cond = function() return vim.bo.filetype ~= "NvimTree" end}
                },        
                lualine_x = {
                    {'location', cond = function() return vim.bo.filetype ~= "NvimTree" end}
                },
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {}
        }

        end, 
    },
    --]]
    {
    "goolord/alpha-nvim",
    -- dependencies = { 'nvim-mini/mini.icons' },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local startify = require("alpha.themes.startify")
      -- available: devicons, mini, default is mini
      -- if provider not loaded and enabled is true, it will try to use another provider
      startify.file_icons.provider = "devicons"
         require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end,
  },
}
