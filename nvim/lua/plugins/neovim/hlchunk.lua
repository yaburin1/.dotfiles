return {
    "shellRaining/hlchunk.nvim",
    event = { "CursorMoved" },
    opts = {
        chunk = {
            enable = true,
            style = { { fg = "#f92657" }, { fg = "#f8f8f0" } },
            -- duration = 150, -- (200)
            delay = 150, --(300)
        },
    },
}
