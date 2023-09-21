return {
    {
        "MunifTanjim/nui.nvim", dependencies = {
            {"google/executor.nvim", config = function()
                require("executor").setup({
                    use_split = false,
                    split = {
                        width = 78,
                    },
                    popup = {
                        width = 78,
                    }
                })

                local map = require("helpers.keys").map
                map("n", "<leader>r", "<cmd>ExecutorRun<cr>", "Run executor")
                map("n", "<leader><Tab>", "<cmd>ExecutorToggleDetail<cr>", "Run executor")
                map("n", "<leader>cc", "<cmd>ExecutorSetCommand<cr>", "Set run command")
                map("n", "<leader>cp", "<cmd>ExecutorSwapToPopup<cr>", "Set executor to Popup")
                map("n", "<leader>cs", "<cmd>ExecutorSwapToSplit<cr>", "Set executor to Split")
            end},
        }
    },
}
