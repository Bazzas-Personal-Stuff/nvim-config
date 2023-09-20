return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        config = function ()
            require('lualine').setup {
                options = {
                    theme = 'nord',
                    component_separators = { left = '', right = ''},
                    section_separators = { left = '', right = ''},
                },
                sections = {
                    lualine_a = {'mode'},
                    lualine_b = {'filename'},
                    lualine_c = {'diagnostics'},
                    lualine_x = {},
                    lualine_y = {},
                    lualine_z = {'location'},
                },
                extensions = {'nvim-tree'},
            }
        end,
    }
} 
