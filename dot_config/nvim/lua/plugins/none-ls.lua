return {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                -- generic
                null_ls.builtins.diagnostics.trail_space,
                -- go
                null_ls.builtins.formatting.golines,
                null_ls.builtins.formatting.goimports_reviser,
                null_ls.builtins.formatting.gofumpt,        -- stricter than gofmt
                null_ls.builtins.diagnostics.golangci_lint,
                null_ls.builtins.code_actions.gomodifytags, -- modify tags easily
                null_ls.builtins.code_actions.impl,         -- generate method stubs for interfaces implementation
                -- rust
                null_ls.builtins.formatting.rustfmt,
                -- python
                null_ls.builtins.formatting.black,
                null_ls.builtins.diagnostics.flake8.with({
                    extra_args = {
                        "--extend-ignore", "E203", "--max-line-length", "88"
                    }
                }),
                null_ls.builtins.formatting.isort.with({
                    extra_args = {
                        "--profile", "black"
                    }
                }),
            }
        })
    end,
    lazy = false,
}
