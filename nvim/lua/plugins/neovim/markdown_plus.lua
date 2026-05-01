return {
    "yousefhadder/markdown-plus.nvim",
    ft = "markdown",
    opts = {
        features = {
            list_management = true,       -- List auto-continuation, indentation, etc.
            table = false,                -- Table support features
            text_formatting = false,      -- Bold, italic, strikethrough, code
            thematic_break = false,       -- Insert/cycle thematic breaks
            headers_toc = false,          -- Header manipulation and TOC generation
            links = false,                -- Link management and references
            images = false,               -- Image link insertion and editing
            quotes = false,               -- Blockquote (>) management
            callouts = false,             -- GitHub Flavored Markdown callouts/admonitions
            code_block = false,           -- Fenced code block insertion, wrapping, navigation
            html_block_awareness = false, -- Skip markdown ops inside GFM HTML blocks
            footnotes = false,            -- Footnote insertion, navigation, and listing
        },
        -- keymaps = {
        --     enabled = false,
        -- },
        table = {
            keymaps = {
                enabled = false,
            },
        },
    },
    config = function(_, opts)
        require("markdown-plus").setup(opts)
    end

}
