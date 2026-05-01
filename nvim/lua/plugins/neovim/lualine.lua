return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = { "ModeChanged" },
    opts = {
        options = {
            globalstatus = true, --false
        },
        sections = {
            lualine_b = {
                "branch",
                "diff",
                {
                    "diagnostics",
                    sources = { "nvim_diagnostic" },
                },
                {
                    function()
                        local reg = vim.fn.reg_recording()
                        return reg ~= "" and ("REC @" .. reg) or ""
                    end,
                    color = { fg = "red", gui = "bold" },
                }
            },
            lualine_c = {
                {
                    "filename",
                    path = 4, --1(相対パス)--4(1階層上のみ)
                    file_status = false,
                },
            },
            lualine_y = {
                "progress",
                { "datetime", style = "%m/%d" },
            },
            lualine_z = { { "datetime", style = "%H:%M" } },
        },
        tabline = {
            lualine_a = {
                {
                    "buffers",
                    max_length = vim.api.nvim_win_get_width(0) * 3,
                    icons_enabled = false,
                    component_separators = { left = "", right = "" },
                    section_separators = { left = "", right = "" },
                    show_modified_status = false,

                    fmt = function(str, context)
                        local icon, icon_color = require("nvim-web-devicons").get_icon(str)
                        icon = icon or " "
                        local diagnostic = vim.diagnostic
                        local name_color = context.current and "Normal" or "Comment"
                        local diags = diagnostic.get(context.bufnr)
                        local best_severity = nil
                        local count = 0
                        for _, d in ipairs(diags) do
                            if not best_severity or d.severity < best_severity then
                                best_severity = d.severity
                                count = 1
                            elseif d.severity == best_severity then
                                count = count + 1
                            end
                        end
                        local diag_text = ""
                        if best_severity then
                            local severity = diagnostic.severity
                            local map = {
                                [severity.ERROR] = { "", "DiagnosticError" },
                                [severity.WARN] = { "", "DiagnosticWarn" },
                                [severity.INFO] = { "", "DiagnosticInfo" },
                                [severity.HINT] = { "", "DiagnosticHint" },
                            }
                            local info = map[best_severity]
                            diag_text = string.format("%%#%s#%s %d%%*", info[2], info[1], count)
                        end

                        return string.format(
                            "%%#%s#%s%%* %%#%s#%s%%* %s",
                            icon_color or "Normal",
                            icon,
                            name_color,
                            str,
                            diag_text
                        )
                    end,
                    buffers_color = {
                        active = "Normal",
                        inactive = "Comment",
                    },

                    symbols = {
                        modified = "",
                        alternate_file = "",
                        directory = "",
                    },
                },
            },
        },
        inactive_sections = {}, --無効化
    },
}
