return {
    'nvim-telescope/telescope.nvim', tag = '0.1.3',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'tiagovla/scope.nvim',
    },
    config = function()
        require("telescope").load_extension("scope")
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>p", builtin.find_files, {})
        vim.keymap.set("n", "<leader>/", builtin.live_grep, {})
        vim.keymap.set("n", "<S-Tab>", "<Cmd>Telescope scope buffers<CR>", {})

    end,
}
