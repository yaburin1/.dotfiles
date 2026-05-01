return {
    "shortcuts/no-neck-pain.nvim",
    event = { "BufEnter" }, --*
    version = "*",
    opts = {
        width = 130, --100
        -- minSideBufferWidth = 0, --10
        -- 自動コマンド設定
        autocmds = {
            enableOnVimEnter = "safe",        --false
            enableOnTabEnter = true,          --false
            reloadOnColorSchemeChange = true, --false
            -- skipEnteringNoNeckPainBuffer = false, --false
        },
        -- キーマッピング設定
        mappings = {
            enabled = true, --false
            toggle = "<Leader>nn",
            toggleLeftSide = "<Leader>nh",
            toggleRightSide = "<Leader>nl",
            -- 幅を増やす(+5)
            widthUp = { mapping = "<Leader>n+", value = 5 },
            -- 幅を減らす(-5)
            widthDown = { mapping = "<Leader>n-", value = 5 },
            -- スクラッチパッド機能を切り替え
            scratchPad = "<Leader>ns",
            debug = false,
        },

        -- 両方のサイドバッファに共通の設定
        buffers = {
            scratchPad = {
                -- enabled = true, --false
                pathToFile = "~/.config/nvim/notes/note.md",
                -- pathToFile = "",
            },
            colors = {
                background = "catppuccin-frappe",
            },
            --
            -- 	-- バッファスコープオプション(vim.bo)
            bo = {
                filetype = "markdown",
                buftype = "", --"nofile"
            },
            --
            -- 	-- ウィンドウスコープオプション(vim.wo)
            wo = {
                fillchars = "eob: ",
                -- 		-- cursorline = true, --false
                -- 		-- cursorcolumn = false,
                -- 		-- colorcolumn = "0", --"0"
                -- 		-- number = false, --false
                -- 		-- relativenumber = false, --false
            },
            left = {
                enabled = true,     --true
                scratchPad = {
                    enabled = true, --true
                    -- pathToFile = string.format("~/.config/nvim/notes/%s-left.md", os.date("%Y-%m-%d")), --""
                },
            },
            right = {
                enabled = false, --true
                -- 		scratchPad = {
                -- 			enabled = false, --true
                -- 			pathToFile = string.format("~/.config/nvim/notes/%s-right.md", os.date("%Y-%m-%d")), --""
                -- 		},
            },
        },
    },
}
