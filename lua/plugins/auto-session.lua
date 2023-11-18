return {
    {
        "rmagatti/auto-session",
        config = function ()
            require("auto-session").setup({
                pre_save_cmds = {"NvimTreeClose"},
                log_level = "error",
            })
        end
    }
}
