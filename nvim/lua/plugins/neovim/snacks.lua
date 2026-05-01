return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    --perform
    animate = { fps = 60, },
    quickfile = {},
    bigfile = {},
    --git
    gh = {},
    git = {},
    gitbrowse = {},
    --
    words = {
      notify_end = false,
    },
    dashboard = {},
    scroll = {},
    terminal = {},
    zen = {
      toggles = {
        dim = false,
      },
      zoom = {
        toggles = {
          dim = false,
        },
        show = { statusline = false, tabline = false },
        win = {
          backdrop = false,
          width = 0,
        },
      },
    },
    picker = {
      win = {
        input = {
          keys = {
            ["<leader><space>"] = { "cancel", mode = { "i", "n" } },
          },
        },
      },
    },
    styles = {
      terminal = {
        position = "float",
        backdrop = 60,
        height = 0.9,
        width = 0.9,
        zindex = 50,
      },
      zen = {
        width = 130,
      }
    }

  },
  keys = {
    -- Top Pickers & Explorer
    { "<leader><space>", function() Snacks.picker.smart() end,                                   desc = "Smart Find Files" },
    -- find
    { "<leader>ff",      function() Snacks.picker.smart() end,                                   desc = "Smart Find Files" },
    { "<leader>fp",      function() Snacks.picker.projects() end,                                desc = "Find Projects" },
    { "<leader>fb",      function() Snacks.picker.buffers() end,                                 desc = "Find Buffers" },
    { "<leader>fn",      function() Snacks.picker.scratch() end,                                 desc = "Find Scratch" },
    { "<leader>fg",      function() Snacks.picker.grep() end,                                    desc = "Grep" },
    { "<leader>fc",      function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config" },

    -- git
    { "<leader>gd",      function() Snacks.picker.git_diff() end,                                desc = "Git Diff (Hunks)" },
    { "<leader>gb",      function() Snacks.picker.git_branches() end,                            desc = "Git Branches" },
    { "<leader>gs",      function() Snacks.picker.git_status() end,                              desc = "Git Status" },
    { "<leader>gl",      function() Snacks.picker.git_log() end,                                 desc = "Git Log" },

    { "<leader>gi",      function() Snacks.picker.gh_issue() end,                                desc = "GitHub Issues (open)" },
    { "<leader>gI",      function() Snacks.picker.gh_issue({ state = "all" }) end,               desc = "GitHub Issues (all)" },
    { "<leader>gp",      function() Snacks.picker.gh_pr() end,                                   desc = "GitHub Pull Requests (open)" },
    { "<leader>gP",      function() Snacks.picker.gh_pr({ state = "all" }) end,                  desc = "GitHub Pull Requests (all)" },
    { "<leader>gB",      function() Snacks.gitbrowse() end,                                      desc = "Git Browse",                 mode = { "n", "v" } },
    -- Grep
    { "<leader>sg",      function() Snacks.picker.grep() end,                                    desc = "Grep" },
    { "<leader>sw",      function() Snacks.picker.grep_word() end,                               desc = "Visual selection or word",   mode = { "n", "x" } },
    -- search
    { "<leader>sp",      function() Snacks.picker() end,                                         desc = "Selection Picker" },
    { "<leader>sd",      function() Snacks.picker.diagnostics() end,                             desc = "Diagnostics" },
    { "<leader>sD",      function() Snacks.picker.diagnostics_buffer() end,                      desc = "Buffer Diagnostics" },
    { "<leader>sq",      function() Snacks.picker.qflist() end,                                  desc = "Quickfix List" },
    { "<leader>sl",      function() Snacks.picker.loclist() end,                                 desc = "Location List" },
    -- Other
    { "<leader>z",       function() Snacks.zen() end,                                            desc = "Toggle Zen Mode" },
    { "<leader>Z",       function() Snacks.zen.zoom() end,                                       desc = "Toggle Zoom" },
    { "<C-@>",           function() Snacks.terminal() end,                                       desc = "Toggle Terminal",            mode = { "n", "t" } },

    { "]]",              function() Snacks.words.jump(vim.v.count1, true) end,                   desc = "Next Reference",             mode = { "n", "t" } },
    { "[[",              function() Snacks.words.jump(-vim.v.count1, true) end,                  desc = "Prev Reference",             mode = { "n", "t" } },
  },
}
