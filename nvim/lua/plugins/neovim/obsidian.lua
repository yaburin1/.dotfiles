return {
    "obsidian-nvim/obsidian.nvim",
    version = "*",
    ft = "markdown",
    cmd = "Obsidian",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = {
        legacy_commands = false,
        workspaces = {
            {
                name = "Valt Root",
                path = "~/.vault",
            },
        },
        -- ui = { enable = false },
        templates = {
            folder = "templates",
        },
        daily_notes = {
            template = "daily.md",
        },
        checkbox = {
            enabled = true,
            create_new = true,
            order = { " ", "x" },
        },
    },
    config = function(_, opts)
        local obsidian = require("obsidian")
        obsidian.setup(opts)
        local api = vim.api
        local group = api.nvim_create_augroup("toggle_checkbox_key", {})

        api.nvim_create_autocmd("FileType", {
            group = group,
            pattern = "markdown",
            callback = function(event)
                vim.keymap.set("n", "<CR>", obsidian.actions.smart_action(), { buffer = event.buf })
            end,
        })
    end
}
