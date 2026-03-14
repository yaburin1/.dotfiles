return {

	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			{ "theHamsta/nvim-dap-virtual-text", opts = {
				virt_text_pos = "eol",
			} },
			{ "jay-babu/mason-nvim-dap.nvim", opts = {} },
			"mfussenegger/nvim-dap-python",
			-- {
			-- 	"mrcjkb/rustaceanvim",
			-- 	version = "^8", -- Recommended
			-- 	ft = { "rust" },
			-- 	event = { "BufReadPost", "BufNewFile" }, --*
			-- },
			-- { "dchinmay2/clangd_extensions.nvim", opts = {} },
		},
		keys = {
			{
				mode = { "n" },
				"<F5>",
				function()
					require("dap").continue()
				end,
			},
			{
				mode = { "n" },
				"<F10>",
				function()
					require("dap").step_over()
				end,
			},
			{
				mode = { "n" },
				"<F11>",
				function()
					require("dap").step_into()
				end,
			},
			{
				mode = { "n" },
				"<F11>",
				function()
					require("dap").step_out()
				end,
			},
			{
				mode = { "n" },
				"<leader>b",
				function()
					require("dap").toggle_breakpoint()
				end,
			},
		},
		config = function()
			require("dap-python").setup("python")
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end

			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
			-- C / C++ / Rust 設定
			dap.adapters.codelldb = {
				type = "server",
				port = "${port}",
				executable = {
					command = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/adapter/codelldb",
					args = { "--port", "${port}" },
				},
			}

			-- C++
			dap.configurations = {
				cpp = {
					{
						name = "Launch file",
						type = "codelldb",
						request = "launch",
						program = function()
							local file = vim.fn.expand("%:p")
							local exe = vim.fn.expand("%:p:r")
							local cmd = "g++ -g -O0 '" .. file .. "' -o '" .. exe .. "'"
							vim.fn.system(cmd)
							return exe
						end,
						cwd = "${workspaceFolder}",
						stopOnEntry = false,
						runInTerminal = true,
					},
				},
				rust = {
					{
						name = "Launch",
						type = "codelldb",
						request = "launch",
						program = function()
							local cargo_toml = vim.fn.getcwd() .. "/Cargo.toml"
							local name = vim.fn.system("grep '^name' " .. cargo_toml .. " | head -1 | cut -d'\"' -f2")
							name = name:gsub("%s+", "")
							return vim.fn.getcwd() .. "/target/debug/" .. name
						end,
						cwd = "${workspaceFolder}",
						stopOnEntry = false,
						args = {},
					},
				},
			}
		end,
	},
}
