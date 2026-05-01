return {
    -- lazy = false,
    'mrjones2014/smart-splits.nvim',
    -- lazy = false,
    event = { "VeryLazy" },
    keys = {
        -- resize
        { "<A-H>", function() require("smart-splits").resize_left() end,       mode = "n" },
        { "<A-J>", function() require("smart-splits").resize_down() end,       mode = "n" },
        { "<A-K>", function() require("smart-splits").resize_up() end,         mode = "n" },
        { "<A-L>", function() require("smart-splits").resize_right() end,      mode = "n" },
        -- move
        { "<A-h>", function() require("smart-splits").move_cursor_left() end,  mode = "n" },
        { "<A-j>", function() require("smart-splits").move_cursor_down() end,  mode = "n" },
        { "<A-k>", function() require("smart-splits").move_cursor_up() end,    mode = "n" },
        { "<A-l>", function() require("smart-splits").move_cursor_right() end, mode = "n" },
    },
    opts = {}
}
