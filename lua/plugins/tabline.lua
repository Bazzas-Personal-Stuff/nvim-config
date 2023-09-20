return {
    {
        "akinsho/bufferline.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function ()
            require("bufferline").setup({
                options = {
                    right_mouse_command = nil,
                    middle_mouse_command = "buffer %d",
                    -- color_icons = false,
                    hover = {
                        enabled = true,
                        delay = 200,
                        reveal = {'close'},
                    },
                    offsets = {
                        {
                            filetype = "fern",
                            text = "File Explorer",
                            text_align = "left",
                            separator = true,
                        },
                    },
                    sort_by = 'directory',
                    diagnostics = "nvim_lsp"
                },
            })
        end
    }
}
