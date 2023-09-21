return {
    {
        "nvim-tree/nvim-tree.lua",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function ()

            local function my_on_attach(bufnr)
                local api = require('nvim-tree.api')
                local function opts(desc)
                    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true}
                end

                local map = vim.keymap.set

                -- Help
                map('n', '?',           api.tree.toggle_help,                   opts("Help"))
                map('n', 'q',           api.tree.toggle_help,                   opts("Close tree window"))
                -- Tree navigation
                map('n', 'l',           api.node.open.edit,                     opts("Open"))
                map('n', '<leader>l',   api.tree.expand_all,                    opts("Expand all"))
                map('n', 'h',           api.node.navigate.parent_close,         opts("Close directory"))
                map('n', '<leader>h',   api.tree.collapse_all,                  opts("Collapse all"))
                map('n', '<BS>',        api.tree.change_root_to_parent,         opts("Up directory"))
                map('n', '<CR>',        api.tree.change_root_to_node,           opts("Enter directory"))
                -- Edit filesystem
                map('n', 'n',           api.fs.create,                          opts("Create"))
                map('n', 'r',           api.fs.rename,                          opts("Rename"))
                map('n', 'yy',          api.fs.copy.node,                       opts("Copy"))
                map('n', 'x',           api.fs.cut,                             opts("Cut"))
                map('n', 'p',           api.fs.paste,                           opts("Paste"))
                map('n', '<DEL>',       api.fs.remove,                          opts("Delete"))
                map('n', '<S-DEL>',     api.fs.trash,                           opts("Trash"))
                -- Filter
                map('n', 'D',           api.tree.toggle_hidden_filter,          opts("Toggle filter: dotfiles"))
                map('n', 'I',           api.tree.toggle_gitignore_filter,       opts("Toggle filter: git ignored"))
                -- File paths
                map('n', 'ypa',         api.fs.copy.absolute_path,              opts("Copy absolute path"))
                map('n', 'ypp',         api.fs.copy.relative_path,              opts("Copy relative path"))
                map('n', 'yf',          api.fs.copy.filename,                   opts("Copy filename"))
                -- Mouse
                map('n', '<LeftMouse>', api.node.open.edit,                     opts("Open"))
            end

            require("nvim-tree").setup({
                on_attach = my_on_attach,
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
