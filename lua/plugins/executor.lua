return {
    {
        "MunifTanjim/nui.nvim", dependencies = {
            {"google/executor.nvim", config = function()
                require("executor").setup({})

                local map = require("helpers.keys").map
                map("n", "<leader>r", "<cmd>ExecutorRun<cr>", "Run executor")
            end},
        }
    },
}
