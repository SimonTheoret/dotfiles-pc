return {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim",
        "nvim-neorg/neorg-telescope"
    },
    config = function()
        require("neorg").setup {
            load = {
                ["core.defaults"] = {},
                ["core.concealer"] ={},
                ["core.dirman"] = {
                    config = {
                        workspaces = {
                            notes = "~/org/notes",
                        },
                        default_workspace = "notes",
                    },
                    index = "index.norg"
                },
                ["core.completion"] = { config = { engine = "nvim-cmp"} },
                ["core.manoeuvre"] = {},
                ["core.summary"] = {},
                ["core.integrations.telescope"] = {},

                -- ["core.ui.calendar"] = {},
            },
        }

        local neorg_callbacks = require("neorg.core.callbacks")

        ---@diagnostic disable-next-line: missing-parameter
        neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
            -- Map all the below keybinds only when the "norg" mode is active
            keybinds.map_event_to_mode("norg", {
                n = { -- Bind keys in normal mode
                    { "<leader>nfn", "core.integrations.telescope.find_linkable" },
                },

                i = { -- Bind in insert mode
                    { "<C-l>", "core.integrations.telescope.insert_link" },
                },
            }, {
                silent = true,
                noremap = true,
            })
        end)

        vim.wo.foldlevel = 99
        vim.wo.conceallevel = 3
    end,
    lazy = true,
    ft = "norg",
    keys = {
        {
            "<leader>nwn",
            function()
                local dirman = require('neorg').modules.get_module("core.dirman")
                if dirman ~= nil then
                    local input = vim.fn.input({ prompt = 'New note name: ', default = 'new_note' })
                    local inpt = string.format("%s.norg", input)
                    dirman.create_file(inpt, "notes", {
                        no_open  = false, -- open file after creation?
                        force    = false, -- overwrite file if exists
                        metadata = {}     -- key-value table for metadata fields
                    })
                    vim.cmd("lcd ~/org/notes") -- Locally changes dir
                end
            end,
            desc = "Create new notes"
        },
        { "<leader>nfi", ":Neorg index<CR> :cd %:h<CR>", desc = "Go to notes index" },
        {"<leader><localleader>t", ":Neorg toc<CR>", desc = "Table of content"},
    }
}
