return {
    {
        "tiagovla/scope.nvim",
        config = function ()
            require("scope").setup({})
            local map = require("helpers.keys").map
        end
    }
}
