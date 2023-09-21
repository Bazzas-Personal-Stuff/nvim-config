return {
    {
        "MunifTanjim/nui.nvim", dependencies = {
            {"google/executor.nvim", config = function()
                require("executor").setup({
                    use_split = false,
                    popup = {
                        width = 78,
                    }
                })

                local map = require("helpers.keys").map
                map("n", "<leader>r", "<cmd>ExecutorRun<cr>", "Run executor")
                map("n", "<leader><Tab>", "<cmd>ExecutorToggleDetail<cr>", "Run executor")
                map("n", "<leader>c", "<cmd>ExecutorSetCommand<cr>", "Set run command")
            end},
        }
    },
}
