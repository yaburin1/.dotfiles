return {
    {
        "mason-org/mason.nvim",
        opts = {},
    },
    {
        "mason-org/mason-lspconfig.nvim",
        event = { "CursorMoved", "ModeChanged" },
        opts = {
            -- ensure_installed = { "lua_ls", "rust_analyzer" },
        },
        config = function(_, otps)
            require("mason-lspconfig").setup(otps)

            local nvim_set_hl = vim.api.nvim_set_hl
            nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = "#ffc0b9", bg = "#564a4b" })
            nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg = "#fce094", bg = "#555143" })
            nvim_set_hl(0, "DiagnosticVirtualLinesError", { fg = "#ffc0b9", bg = "#564a4b" })
            nvim_set_hl(0, "DiagnosticVirtualLinesWarn", { fg = "#fce094", bg = "#555143" })

            vim.diagnostic.config({
                severity_sort = true,
                -- virtual_lines = {
                --     source = "if_many",
                --     current_line = true,
                --     severity = { min = vim.diagnostic.severity.WARN },
                -- },
                virtual_text = {
                    current_line = true,
                    source = "if_many",
                    severity = { min = vim.diagnostic.severity.WARN },
                    prefix = "●",
                    -- suffix = {},
                    -- spacing = 4,
                },
            })
        end
    },
}
