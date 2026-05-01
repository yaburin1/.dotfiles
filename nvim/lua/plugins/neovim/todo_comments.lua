return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        sign_priority = 20,
    },
    event = { "CursorMoved", "ModeChanged" },
    keys = {
        -- {
        --     "]t",
        --     function()
        --         require("todo-comments").jump_next()
        --     end,
        --     desc = "Next todo comment",
        --     mode = "n"
        -- },
        -- {
        --     "]t",
        --     function()
        --         require("todo-comments").jump_prev()
        --     end,
        --     desc = "Previous todo comment",
        --     mode = "n"
        -- }
    }

}
