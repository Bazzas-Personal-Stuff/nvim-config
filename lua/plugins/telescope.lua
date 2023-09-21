return {
    'nvim-telescope/telescope.nvim', tag = '0.1.3',
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- { 
        --     'prochri/telescope-all-recent.nvim',
        --     dependencies = { 'kkharji/sqlite.lua', },
        -- },
    },
    config = function()
        require("telescope").setup{
            pickers = {
                find_files = {
                    theme = "dropdown",
                },
            },
        }
        -- require("telescope-all-recent").setup({})
        map = require("helpers.keys").map

        map("n", "<leader>p", function() require('telescope').builtin.find_files() end, "Find files in project")
        -- map("n", "<S-Tab>", builtin.buffers, "Pick buffer")

    end,
}
