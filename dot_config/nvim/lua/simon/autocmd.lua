-- List of autocommands

-- Fold all when opening neorg file
vim.api.nvim_create_autocmd({ "BufRead"}, {
    pattern = { "*" },
    callback = function(_)
        if vim.bo.filetype == "norg" then
            vim.o.foldlevel = 0 -- Close all folds if norg file
            -- vim.opt.textwidth = 88
        else
            vim.o.foldlevel = 99 -- Open all files if anything else
            -- vim.opt.textwidth = 0
        end
    end
})
--
-- Wraps lines of more then 80 characters in .norg, .md  files
-- vim.api.nvim_create_autocmd({"BufRead"}, {
--     pattern = { "*.norg", "*.md"  },
--     callback = function(_)
--         local pattern  = { "norg", "md"}
--         for ft in pattern do
--             if vim.bo.filetype == ft then
--                 vim.opt.textwidth = 80
--                 print("in a norg/md file")
--             else
--                 vim.opt.textwidth = 0
--                 print("not in a norg/ md file")
--             end
--         end
--     end })
vim.api.nvim_create_autocmd({"BufNewFile"},{
    pattern = {".sh"},
    callback = function(_)
        vim.api.nvim_buf_set_lines(0, 0, 0, true, {"#!/usr/bin/env sh"})
    end
})
