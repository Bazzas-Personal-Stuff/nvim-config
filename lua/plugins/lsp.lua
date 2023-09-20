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
        require("mason").setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        })

        local lsp = require("lsp-zero")
        lsp.preset("recommended")
        lsp.ensure_installed({
            'ols',
        })

        -- Set up diagnostic signs
        local signs = { Error = "", Warn = "", Hint = "󰌶", Info = "" }
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
        local cmp_mappings = lsp.defaults.cmp_mappings({
            ["<Up>"] = cmp.mapping.select_prev_item(cmp_select),
            ["<Down>"] = cmp.mapping.select_next_item(cmp_select),
            ["<Tab>"] = cmp.mapping.confirm({select = true}),
            ["<C-Space>"] = cmp.mapping.complete(),
        })

        lsp.setup_nvim_cmp({
            mapping = cmp_mappings
        })

        lsp.on_attach(function(client, bufnr)
            local opts = {buffer = bufnr, remap = false}
            
            vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
            vim.keymap.set("n", "<leader>h", function() vim.lsp.buf.hover() end, opts)
            vim.keymap.set("n", "gx", function() vim.diagnostic.open_float() end, opts)
            vim.keymap.set("n", "<leader><Enter>", function() vim.lsp.buf.code_action() end, opts)
            vim.keymap.set("n", "gu", function() vim.lsp.buf.references() end, opts)
            vim.keymap.set("n", "<leader>mov", function() vim.lsp.buf.rename() end, opts)
            vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        end)

        lsp.setup()
    end,
}
