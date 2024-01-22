-- List of autocommands

-- Fold all when opening neorg file
-- vim.api.nvim_create_autocmd({ "BufRead" }, {
--     pattern = { "*" },
--     callback = function(_)
--         if vim.bo.filetype == "norg" or vim.bo.filetype == "markdown" then
--             print("this is a norg file")
--         else
--             vim.o.foldlevel = 99 -- Open all folds if not norg or markdown else
--             vim.opt.textwidth = 0
--             print("this is not a norg file")
--         end
--     end
-- })

vim.api.nvim_create_autocmd({ "BufRead" }, {
    pattern = { "*.norg" },
    callback = function(_)
        vim.api.nvim_buf_set_keymap(0, "n", "<tab>", "za", { desc = "Toggle fold" }) -- cute remap for neorg
        vim.opt_local.foldlevel = 0
        vim.opt_local.textwidth = 80
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
vim.api.nvim_create_autocmd({ "BufNewFile" }, {
    pattern = { "*.sh" },
    callback = function(_)
        vim.api.nvim_buf_set_lines(0, 0, 0, true, { "#!/usr/bin/env sh" })
    end
})
