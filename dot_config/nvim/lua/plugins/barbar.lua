return {
    'romgrk/barbar.nvim',
    dependencies = {
        'lewis6991/gitsigns.nvim',   -- OPTIONAL: for git status
        'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
        -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
        -- animation = true,
        -- insert_at_start = true,
        -- …etc.
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
    lazy = false,
    keys = {
        -- Move to previous/next
        { '<A-,>', '<Cmd>BufferPrevious<CR>', desc = "Previous buffer"},
        { '<A-.>', '<Cmd>BufferNext<CR>', desc = "Next buffer"},
        -- Re-order to previous/next
        { '<A-<>', '<Cmd>BufferMovePrevious<CR>', desc = "Buffer move previous"},
        { '<A->>', '<Cmd>BufferMoveNext<CR>', desc = "Buffer move next"},
        -- Goto buffer in position...
        { '<A-1>', '<Cmd>BufferGoto 1<CR>',   desc = "Goto buffer 1"},
        { '<A-2>', '<Cmd>BufferGoto 2<CR>', desc = "Goto buffer 2"},
        { '<A-3>', '<Cmd>BufferGoto 3<CR>',  desc = "Goto buffer 3"},
        { '<A-4>', '<Cmd>BufferGoto 4<CR>', desc = "Goto buffer 4"},
        { '<A-5>', '<Cmd>BufferGoto 5<CR>', desc = "Goto buffer 5"},
        { '<A-6>', '<Cmd>BufferGoto 6<CR>', desc = "Goto buffer 6"},
        { '<A-7>', '<Cmd>BufferGoto 7<CR>', desc = "Goto buffer 7"},
        { '<A-8>', '<Cmd>BufferGoto 8<CR>',  desc = "Goto buffer 8"},
        { '<A-9>', '<Cmd>BufferGoto 9<CR>',  desc = "Goto buffer 9"},
        { '<A-0>', '<Cmd>BufferLast<CR>',  desc = "Last buffer"},
        -- Pin/unpin buffer
        -- Magic buffer-picking mode
        { '<C-p>', '<Cmd>BufferPick<CR>', desc = "Magic pick buffer"},
    },
}
