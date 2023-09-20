return {
    {
        "lambdalisue/fern.vim", 
        lazy = false, 
        config = function()
            local map = require("helpers.keys").map
            map("n", "<leader>e", "<cmd>Fern . -drawer<cr>", "Open Fern")
        end,
        dependencies = {
            "lambdalisue/fern-hijack.vim",
            "lambdalisue/fern-git-status.vim",
            {
                "lambdalisue/fern-renderer-nerdfont.vim",
                dependencies = {
                    "lambdalisue/nerdfont.vim",
                },
                config = function()
                    vim.cmd[[let g:fern#renderer = "nerdfont"]]
                end
            },
        }
    },
}
