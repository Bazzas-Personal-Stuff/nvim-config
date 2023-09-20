return {
    {
        "numToStr/Comment.nvim",
        opts = {
            mappings = {
                basic = false,
                extra = false,
            },
        },
        lazy = false,
        config = function ()
            local comment = require("Comment.api")
            local map = require("helpers.keys").map

            local esc = vim.api.nvim_replace_termcodes('<ESC>', true, false, true)
            
            map("n", "<C-_>", comment.toggle.linewise.current, "Toggle comment on current line")
            map("x", "<C-_>", function() 
                vim.api.nvim_feedkeys(esc, 'nx', false)
                comment.toggle.linewise(vim.fn.visualmode())
            end, "Toggle comment on selected lines")
        end
    }
}
