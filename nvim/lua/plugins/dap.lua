local function configure()
	-- local dap_install = require "dap-install"
	-- dap_install.setup {
	--   installation_path = vim.fn.stdpath "data" .. "/dapinstall/",
	-- }

	local dap_breakpoint = {
		breakpoint = {
			text = "",
			texthl = "LspDiagnosticsSignError",
			linehl = "",
			numhl = "",
		},
		rejected = {
			text = "",
			texthl = "LspDiagnosticsSignHint",
			linehl = "",
			numhl = "",
		},
		stopped = {
			text = "",
			texthl = "LspDiagnosticsSignInformation",
			linehl = "DiagnosticUnderlineInfo",
			numhl = "LspDiagnosticsSignInformation",
		},
	}

	vim.fn.sign_define("DapBreakpoint", dap_breakpoint.breakpoint)
	vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)
	vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)
end


return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"theHamsta/nvim-dap-virtual-text"
	},
	keys = {
		-- normal mode is default
		{ "<f3>", function() require 'dap'.toggle_breakpoint() end , "Toggle Breakpoint" ,  mode = { "n", "i", "v" }},
		{ "<f5>", function() require 'dap'.continue() end },
		{ "<f6>",     function() require 'dap'.step_over() end },
		{ "<f7>",     function() require 'dap'.step_into() end },
		{ "<f8>",     function() require 'dap'.step_out() end , "Step Out"}, 
		{ "<leader>dd", "<cmd>lua require'dap'.continue()<cr>", desc = "continue", mode = {"n"} },
		{ "<leader>da", "<cmd>lua require'dap'.restart_frame()<cr>", desc = "restart frame", mode = {"n"} },
		{ "<leader>dR", "<cmd>lua require'dap'.run_to_cursor()<cr>", desc = "Run to Cursor", mode = {"n"} },
		{ "<leader>dE", "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>", desc = "Evaluate Input", mode = {"n"} }, 
		{ "<leader>dC", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", desc = "Conditional Breakpoint" },
		{ "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", desc = "Toggle UI" },
		{ "<leader>db", "<cmd>lua require'dap'.step_back()<cr>", desc = "Step Back" },
		{ "<leader>dn", "<cmd>lua require'dap'.disconnect()<cr>", desc = "Disconnect" },
		{ "<leader>de", "<cmd>lua require'dapui'.eval()<cr>", desc = "Evaluate" },
		{ "<leader>dg", "<cmd>lua require'dap'.session()<cr>", desc = "Get Session" },
		{ "<leader>dh", "<cmd>lua require'dap.ui.widgets'.hover()<cr>", desc = "Hover Variables" },
		{ "<leader>dS", "<cmd>lua require'dap.ui.widgets'.scopes()<cr>", desc = "Scopes" },
		{ "<leader>dp", "<cmd>lua require'dap'.pause.toggle()<cr>", desc = "Pause" },
		{ "<leader>dq", "<cmd>lua require'dap'.close()<cr>", desc = "Quit" },
		{ "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", desc = "Toggle Repl" },
		{ "<leader>ds", "<cmd>lua require'dap'.continue()<cr>", desc = "Start" },
		{ "<leader>dx", "<cmd>lua require'dap'.terminate()<cr>", desc = "Terminate" },
	},
	config = function() 
		configure()
		require("nvim-dap-virtual-text").setup({
			commented = true,
		})
		require("dapui").setup({
			expand_lines = true,
			icons = { expanded = "", collapsed = "", circular = "" },
			mappings = {
				-- Use a table to apply multiple mappings
				expand = { "<CR>", "<2-LeftMouse>" },
				open = "o",
				remove = "d",
				edit = "e",
				repl = "r",
				toggle = "t",
			},
			layouts = {
				{
					elements = {
						{ id = "scopes", size = 0.33 },
						{ id = "breakpoints", size = 0.17 },
						{ id = "stacks", size = 0.25 },
						{ id = "watches", size = 0.25 },
					},
					size = 0.33,
					position = "right",
				},
				{
					elements = {
						{ id = "repl", size = 0.45 },
						{ id = "console", size = 0.55 },
					},
					size = 0.27,
					position = "bottom",
				},
			},
			floating = {
				max_height = 0.9,
				max_width = 0.5, -- Floats will be treated as percentage of your screen.
				border = vim.g.border_chars, -- Border style. Can be 'single', 'double' or 'rounded'
				mappings = {
					close = { "q", "<Esc>" },
				},
			},
		})
		local dap, dapui = require("dap"), require("dapui")
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open({ reset = true })
		end
		dap.listeners.before.event_terminated["dapui_config"] = dapui.close
		dap.listeners.before.event_exited["dapui_config"] = dapui.close
	end
}
