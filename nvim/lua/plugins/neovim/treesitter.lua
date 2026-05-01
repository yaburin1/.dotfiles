return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    config = function()
        local vi = vim
        local api = vi.api
        local group = api.nvim_create_augroup("nvim_treesitter_start", {})
        -- require("nvim-treesitter").install({ "lua" })
        api.nvim_create_autocmd("FileType", {
            group = group,
            -- pattern = { 'lua','rust', 'python', 'typescript' },
            callback = function(args)
                pcall(vi.treesitter.start, args.buf)
                vi.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                -- vi.wo.foldmethod = "expr"
                -- vi.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
            end,
        })
    end,
}
