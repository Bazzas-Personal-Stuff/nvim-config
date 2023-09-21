return {
    'nvim-telescope/telescope.nvim', tag = '0.1.3',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    config = function()
        require("telescope").setup{
            pickers = {
                find_files = {
                    theme = "dropdown",
                },
            },
        }

        local map = require("helpers.keys").map
        map("n", "<leader>p", function() require("helpers.telescopePickers").prettyFilesPicker({picker = 'find_files'}) end, "Open Project File")
        map("n", "<leader>f", function() require("helpers.telescopePickers").prettyGrepPicker({picker = 'live_grep'}) end, "Search for string")
    end,
}













