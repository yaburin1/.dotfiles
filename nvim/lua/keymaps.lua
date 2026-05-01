local vi = vim
local g = vi.g
local fn = vi.fn
local keymap = vi.keymap.set
local opts = { silent = true }
local cmd = vi.cmd
-------------------
-- COMMON KEYMAP --
-------------------

g.mapleader = " "

-- インデントを揃えてペースト
keymap({ "n", "x", "o" }, "=p", "]p")
keymap({ "n", "x", "o" }, "=P", "[p")

-- sentence (文)
keymap({ "x", "o" }, "iS", "is")
keymap({ "x", "o" }, "aS", "as")

-- 引数リスト移動
keymap({ "n", "x", "o" }, "ga", "]a")
keymap({ "n", "x", "o" }, "gA", "[a")

-- スペルチェック
keymap({ "n", "x", "o" }, "gs", "]s")
keymap({ "n", "x", "o" }, "gS", "[s")


keymap("n", "Y", "y$", opts)
keymap("x", "p", "P", opts)


-- インデントを揃えて挿入
keymap("n", "i", function()
    if fn.empty(fn.getline(".")) == 1 then
        return '"_cc'
    else
        return "i"
    end
end, { expr = true })

keymap("n", "A", function()
    if fn.empty(fn.getline(".")) == 1 then
        return '"_cc'
    else
        return "A"
    end
end, { expr = true })

-- %%で現在ファイルのディレクトリパスを入力(%:hと同じ)
keymap("c", "%%", function()
    if fn.getcmdtype() == ":" then
        return fn.expand("%:h") .. "/"
    else
        return "%%"
    end
end, { expr = true })

------------------------
-- NEOVIM ONLY KEYMAP --
------------------------
if not g.vscode then
    -- incrimental selection
    keymap('x', 'v', 'an', { remap = true, desc = "expand node" })
    keymap('x', 'V', 'in', { remap = true, desc = "shrink node" })

    keymap({ "i" }, "jk", "<ESC>", opts)
    -- keymap({ "t" }, "<Esc><Esc>", [[<C-\><C-n>]], opts)

    keymap({ "n" }, "<C-n>", function()
        cmd.bnext()
    end, opts)
    keymap({ "n" }, "<C-p>", function()
        cmd.bprevious()
    end, opts)
    keymap({ "n" }, "<C-Tab>", function()
        cmd.bnext()
    end, opts)
    keymap({ "n" }, "<C-S-Tab>", function()
        cmd.bprevious()
    end, opts)
else
    ------------------------
    -- VSCODE ONLY KEYMAP --
    ------------------------
    local action = require("vscode").action
    keymap({ "n" }, "<leader>z", function()
        action("workbench.action.toggleZenMode")
    end)
    keymap({ "n" }, "<leader>e", function()
        action("workbench.view.explorer")
    end)
    keymap({ "n" }, "<leader>gg", function()
        action("workbench.view.scm")
    end)
    keymap({ "n" }, "<leader>ff", function()
        action("workbench.action.quickOpen")
    end)
    keymap({ "n" }, "<leader><space>", function()
        action("workbench.action.quickOpen")
    end)
    keymap({ "n" }, "<leader>af", function()
        action("editor.action.formatDocument")
    end)
    keymap({ "n" }, "<leader>q", function()
        action("workbench.action.closeActiveEditor")
    end)
end
