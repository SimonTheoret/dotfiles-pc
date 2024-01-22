return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim", -- required
        "sindrets/diffview.nvim", -- optional - Diff integration

        -- Only one of these is needed, not both.
        "nvim-telescope/telescope.nvim", -- optional
        "ibhagwan/fzf-lua",          -- optional
    },
    config = function ()
        local neogit = require("neogit")
        neogit.setup{
            mappings = {
                commit_editor = {
                    ["<localleader>c<localleader>c"] = "Submit",
                    ["<localleader>c<localleader>k"] = "Abort"
                },
                rebase_editor = {
                    ["<localleader>c<localleader>c"] = "Submit",
                    ["<localleader>c<localleader>k"] = "Abort"
                },
            }
    }
    end,
    keys = {
        {
            "<leader>g/",
            function ()
                require('neogit').open()
            end,
            desc = "Neogit"
        },
        {
            "<leader>gc",
            function()
                require('neogit').open({"commit"})
            end,
            desc= "Neogit commit"

        }
    }
}
