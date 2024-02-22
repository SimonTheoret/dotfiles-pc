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
-- return {
--     "loctvl842/monokai-pro.nvim",
--     config = function()
--         require("monokai-pro").setup({
--             filter = "spectrum",
--             background_clear = {"neo-tree","float_win"},
--         })
--         vim.cmd [[colorscheme monokai-pro]]
--     end,
--     priority = 1000,
--     lazy = false
-- }
return {
    "sainnhe/sonokai",
    lazy = false,
    priority = 1000,
    config = function()
        vim.opt.termguicolors = true
        vim.g.sonokai_style = "default"
        vim.g.sonokai_float_style = "dim"
        vim.g.sonokai_better_performance = true
        vim.g.sonokai_enable_italic = false
        vim.cmd [[colorscheme sonokai]]
    end
}
-- return {
--     'ofirgall/ofirkai.nvim',
--     lazy = false,
--     priority = 1000,
--     config = function()
--         require('ofirkai').setup {
--         }
--     end
-- }
