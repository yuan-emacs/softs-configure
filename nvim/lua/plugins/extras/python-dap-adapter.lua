return   { 
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
       "mfussenegger/nvim-dap-python",
       -- stylua: ignore
       keys = {
            { "<leader>dPt", function() require('dap-python').test_method() end, desc = "Debug Method", ft = "python" },
            { "<leader>dPc", function() require('dap-python').test_class() end, desc = "Debug Class", ft = "python" },
       },
        config = function()
            require("dap-python").setup('~/.local/share/nvim/mason/packages/debugpy/venv/bin/python3');
            -- require("dap-python").setup(LazyVim.get_pkg_path("pthon3"));
            table.insert(require("dap").configurations.python, {
                name = "my python debugger",
                type = "debugpy",
                request = "launch",
                program = "${file}",
                console = "integratedTerminal"
            });
            -- require("dap").configurations.python = {
            --     {
            --         name = "my python debugger",
            --         type = "debugpy",
            --         request = "launch",
            --         program = "${file}",
            --         console = "integratedTerminal"
            --     }
            -- }
        end,
    },
  };
