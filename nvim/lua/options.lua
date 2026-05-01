local vi = vim
local g = vi.g
local fn = vi.fn
local opt = vi.opt

---------------------
-- COMMON SETTINGS --
---------------------

-- [Provider Settings]
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0
g.loaded_python3_provider = 0
g.loaded_node_provider = 0

-- [Indent Settings]
opt.tabstop = 4
opt.shiftwidth = 0
opt.softtabstop = -1
opt.expandtab = true
opt.autoindent = true
-- opt.smartindent = true -- C Stayle Indent


-- [Search Settings]
opt.ignorecase = true
opt.smartcase = true
opt.path:append("**") --findで再帰的にファイル検索

-- [Backup Settings]
opt.undolevels = 5000 --取り消し可能な操作の数 (1000)
opt.swapfile = false  --スワップファイルを作成 (true)

-- [Other Settings]
opt.updatetime = 500 --CursorHoldの起動時間
opt.clipboard = "unnamedplus"


--------------------------
-- NEOVIM ONLY SETTINGS --
--------------------------
if not g.vscode then
    -- [Show Setting]
    opt.number = true
    opt.relativenumber = true
    opt.cursorline = true
    opt.termguicolors = true
    opt.linebreak = true

    -- [Statusline  Setting]
    opt.laststatus = 3
    opt.cmdheight = 0

    --[Move Settting]
    opt.scrolloff = 15   --スクロールを開始するまでの行数 (0)
    opt.showmatch = true --対応する括弧にジャンプ
    opt.matchtime = 2    --対応する括弧のハイライト時間(5)

    -- [Encode Setting]
    opt.fileencoding = "utf-8" --保存時の文字エンコーディング
    opt.fileformat = "unix"    --ファイルの改行コード (unix/dos/mac)
    opt.hidden = true          --ファイルを閉じずにバッファを切り替え (false)

    -- [Window Setting]
    opt.winborder = "rounded"
    opt.splitbelow = true
    opt.splitright = true
    opt.conceallevel = 2 -- .MDのURL等の表示を隠す

    require('vim._core.ui2').enable({
        enable = true,
        msg = {
            targets = 'msg',
            cmd = {
                height = 0.5,
            },
            dialog = {
                height = 0.5,
            },
            msg = {
                height = 0.3,
                timeout = 5000,
            },
            pager = {
                height = 0.5,
            },
        },
    })

    -- [Clipbord Setting]
    if fn.executable('wl-copy') ~= 1 then
        g.clipboard = {
            name = 'OSC 52',
            copy = {
                ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
                ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
            },
            paste = {
                ['+'] = function()
                    return { fn.getreg('0', 1, true), fn.getregtype('0') }
                end,
                ['*'] = function()
                    return { fn.getreg('0', 1, true), fn.getregtype('0') }
                end,
            },
        }
    end
end
