return {
    {
        'matbme/JABS.nvim',
        config = function ()
            require("jabs").setup({
                position = {'left', 'bottom'},
                relative = 'win',
                border = 'single',
                sort_mru = true,
                split_filename = true,
                split_filename_path_width = 20,
                symbols = {
                    current = "", -- default 
                    split = "", -- default 
                    alternate = "󰓡", -- default 
                    hidden = "󱥸", -- default ﬘
                    locked = "", -- default 
                    ro = "󰏯", -- default 
                    edited = "", -- default 
                    terminal = "", -- default 
                    default_file = "", -- Filetype icon if not present in nvim-web-devicons. Default 
                    terminal_symbol = "" -- Filetype icon for a terminal split. Default 
                },
                keymap = {
                    close = "<leader>q",
                    h_split = "<C-j>",
                    v_split = "<C-l>",
                }
            })

            local map = require("helpers.keys").map
            map("n", "<Tab>", "<Cmd>JABSOpen<CR>", "Pick buffer")
        end
    }
}
