return {
    "lewis6991/gitsigns.nvim",
    opts = {
        -- sign_priority = 10,
        -- linehl = true,
        -- word_diff = true,
        -- current_line_blame = true,
        on_attach = function(bufnr)
            local gitsigns = require('gitsigns')

            local function map(mode, l, r, opts)
                opts = opts or {}
                opts.buffer = bufnr
                vim.keymap.set(mode, l, r, opts)
            end

            -- Navigation
            map('n', ']h', function()
                if vim.wo.diff then
                    vim.cmd.normal({ ']h', bang = true })
                else
                    gitsigns.nav_hunk('next')
                end
            end)

            map('n', '[h', function()
                if vim.wo.diff then
                    vim.cmd.normal({ '[h', bang = true })
                else
                    gitsigns.nav_hunk('prev')
                end
            end)
            -- Text object
            map({ 'o', 'x' }, 'ih', gitsigns.select_hunk)
            map({ 'o', 'x' }, 'ah', gitsigns.select_hunk)

            -- add
            map('n', '<leader>ha', gitsigns.stage_hunk)
            map('v', '<leader>ha', function()
                gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
            end)
            map('n', '<leader>hA', gitsigns.stage_buffer)

            -- reset
            map('n', '<leader>hr', gitsigns.reset_hunk)
            map('v', '<leader>hr', function()
                gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
            end)
            map('n', '<leader>hR', gitsigns.reset_buffer)

            -- preview
            map('n', '<leader>hp', gitsigns.preview_hunk_inline)
            map('n', '<leader>hP', gitsigns.preview_hunk)


            -- blame
            map('n', '<leader>hb', function()
                gitsigns.blame_line({ full = true })
            end)

            -- diff
            map('n', '<leader>hd', gitsigns.diffthis)
            map('n', '<leader>hD', function()
                gitsigns.diffthis('~')
            end)

            -- qlist
            map('n', '<leader>hq', gitsigns.setqflist)
            map('n', '<leader>hQ', function() gitsigns.setqflist('all') end)
        end
    },
    event = { "CursorMoved", "ModeChanged" },
}
