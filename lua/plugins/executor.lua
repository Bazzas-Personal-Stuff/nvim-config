return {
    {
        "MunifTanjim/nui.nvim", dependencies = {
            {"google/executor.nvim", config = function()
                require("executor").setup({
                    use_split = false,
                    split = {
                        size = 120,
                    },
                    popup = {
                        width = 120,
                    }
                })

                local map = require("helpers.keys").map
                map("n", "<leader>rr", "<cmd>ExecutorRun<cr>", "Run executor")
                map("n", "<leader>r<Tab>", "<cmd>ExecutorToggleDetail<cr>", "Run executor")
                map("n", "<leader>rc", "<cmd>ExecutorSetCommand<cr>", "Set run command")
                map("n", "<leader>rp", "<cmd>ExecutorSwapToPopup<cr>", "Set executor to Popup")
                map("n", "<leader>rs", "<cmd>ExecutorSwapToSplit<cr>", "Set executor to Split")
            end},
        }
    },
}
