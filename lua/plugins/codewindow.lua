return {
    {
        "gorbit99/codewindow.nvim",
        config = function()
            local codewindow = require("codewindow")
            codewindow.setup({
                auto_enable = true,
            })

            local map = require("helpers.keys").map
            map("n", "<leader>m", codewindow.toggle_minimap, "Toggle code minimap")
        end,
    }
}
