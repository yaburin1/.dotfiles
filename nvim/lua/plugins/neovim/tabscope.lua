return {
    "backdround/tabscope.nvim",
    opts = {},
    cmd = { "TabScopeDebug" },
    event = { "BufAdd", "TabNew", "CmdlineEnter" },
    keys = {
        {
            mode = "n",
            "<leader>q",
            function()
                local api = vim.api
                local cmd = vim.cmd
                local cur = api.nvim_get_current_buf()
                if api.nvim_buf_get_name(cur) ~= "" and vim.bo[cur].modified then
                    local ok, err = pcall(cmd.write)
                    if not ok then
                        vim.notify("保存失敗: " .. tostring(err), vim.log.levels.ERROR)
                        return
                    end
                end
                -- ロード済みリストバッファが現在の1つだけなら終了
                local listed = vim.tbl_filter(function(b)
                    return api.nvim_buf_is_loaded(b) and vim.bo[b].buflisted
                end, api.nvim_list_bufs())

                if #listed == 1 and listed[1] == cur then
                    cmd.quit()
                else
                    local ok, err = pcall(require("tabscope").remove_tab_buffer)
                    if not ok then
                        vim.notify("tabscope バッファ削除失敗: " .. tostring(err), vim.log.levels.WARN)
                    end
                end
            end,
            desc = "タブスコープでバッファを安全に削除",
        },
    },
}
