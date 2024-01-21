return {
    'jbyuki/nabla.nvim',
    config = true,
    keys = {
        {
            "<leader>kj",
            function()
                require("nabla").popup()
            end,
            desc = "Show latex"
        }
    },
}
