-- return {
--   "folke/tokyonight.nvim",
--   lazy = false,
--   priority = 1000,
--   opts = {},
--   config = function ()
--     vim.cmd[[colorscheme tokyonight]]
--   end
-- }
-- return { "catppuccin/nvim", name = "catppuccin", priority = 1000, config = function ()
--     vim.cmd[[colorscheme catppuccin-mocha]]
-- end}
return {
    "loctvl842/monokai-pro.nvim",
    config = function()
        require("monokai-pro").setup({
            filter = "spectrum",
            background_clear = {"neo-tree","float_win"},
        })
        vim.cmd [[colorscheme monokai-pro]]
    end,
    priority = 1000,
    lazy = false
}
