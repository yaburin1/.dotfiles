local vi = vim
local fn = vi.fn
local g = vi.g
local lazypath = fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vi.uv or vi.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vi.v.shell_error ~= 0 then
        vi.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        fn.getchar()
        os.exit(1)
    end
end
vi.opt.rtp:prepend(lazypath)

require("lazy").setup({
    defaults = {
        lazy = true,
    },
    rocks = {
        enabled = false,
    },
    spec = {
        { import = "plugins.common" },
        {
            import = g.vscode and "plugins.vscode" or "plugins.neovim",
        },
    },
    local_spec = false,
    install = { colorscheme = g.vscode and {} or { "monokai" } },
    performance = {
        cache = { enabled = true },
        reset_packpath = true,
    },
})
