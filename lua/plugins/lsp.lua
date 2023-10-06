return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},             -- Required
        {'williamboman/mason.nvim'},           -- Optional
        {'williamboman/mason-lspconfig.nvim'}, -- Optional

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},     -- Required
        {'hrsh7th/cmp-nvim-lsp'}, -- Required
        {'L3MON4D3/LuaSnip'},     -- Required
    },

    config = function()
        local lsp_zero = require("lsp-zero")
        require("mason").setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        })

        require("mason-lspconfig").setup({
            ensure_installed = { 'ols' },
            handlers = {
                lsp_zero.default_setup,
            },
        })


        -- Set up diagnostic signs
        local signs = { Error = "", Warn = "", Hint = "󰌵", Info = "" }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        local diag_config = {
            virtual_text = false,
            signs = {
                active = signs,
            },
            update_in_insert = true,
            underline = true,
            severity_sort = true,
            float = {
                focusable = true,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        }
        vim.diagnostic.config(diag_config)

        local cmp = require('cmp')
        local cmp_select = {behaviour = cmp.SelectBehavior.Select}
        local cmp_mappings = lsp_zero.defaults.cmp_mappings({
            ["<Up>"] = cmp.mapping.select_prev_item(cmp_select),
            ["<Down>"] = cmp.mapping.select_next_item(cmp_select),
            ["<Tab>"] = cmp.mapping.confirm({select = true}),
            ["<C-Space>"] = cmp.mapping.complete(),
        })

        lsp_zero.setup_nvim_cmp({
            mapping = cmp_mappings
        })

        lsp_zero.preset({
            float_border = 'rounded',
            call_servers = 'local',
            configure_diagnostics = true,
            setup_servers_on_start = true,
            set_lsp_keymaps = {
                preserve_mappings = true,
                omit = {},
            },
            manage_nvim_cmp = {
                set_sources = 'recommended',
                set_basic_mappings = false,
                set_extra_mappings = false,
                use_luasnip = true,
                set_format = true,
                documentation_window = true,
            },
        })

        lsp_zero.on_attach(function(client, bufnr)
            local opts = {buffer = bufnr, remap = false}
            
            vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
            vim.keymap.set("n", "<leader>h", function() vim.lsp.buf.hover() end, opts)
            vim.keymap.set("n", "gx", function() vim.diagnostic.open_float() end, opts)
            vim.keymap.set("n", "<leader><Enter>", function() vim.lsp.buf.code_action() end, opts)
            vim.keymap.set("n", "gu", function() vim.lsp.buf.references() end, opts)
            vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
            vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)


            -- local map = require("helpers.keys").lsp_map
            --
            -- map("gd", function() vim.lsp.buf.definition() end, "Go to definition")
            -- map("<leader>h", function() vim.lsp.buf.hover() end, "Hover")
            -- map("gx", function() vim.diagnostic.open_float() end, "Open diagnostic")
            -- map("<leader><Enter>", function() vim.lsp.buf.code_action() end, "Code action")
            -- map("gu", function() vim.lsp.buf.references() end, "Usages")
        end)

        lsp_zero.setup()
    end,
}
