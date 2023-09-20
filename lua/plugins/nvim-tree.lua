return {
    {
        "nvim-tree/nvim-tree.lua",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function ()
            require("nvim-tree").setup({
                renderer = {
                    icons = {
                        git_placement = "after",
                        modified_placement = "before",
                        show = {
                            folder_arrow = false
                        },
                        glyphs = {
                            git = {
                                unstaged = "",
                                staged = "",
                                unmerged = "",
                                renamed = "󱞇",
                                untracked = "󰜄",
                                deleted = "󰛲",
                                ignored = "󱥸",
                            },
                        },
                    },
                },
                git = {
                    show_on_open_dirs = false,
                },
                diagnostics = {
                    enable = true,
                    show_on_dirs = true,
                    show_on_open_dirs = false,
                    severity = {
                        min = vim.diagnostic.severity.WARN,
                        max = vim.diagnostic.severity.ERROR,
                    },
                },
                modified = {
                    enable = true
                },
            })
            local map = require("helpers.keys").map
            map("n", "<leader>e", "<Cmd>NvimTreeFocus<CR>", "Focus file explorer")
        end,
    }
}
