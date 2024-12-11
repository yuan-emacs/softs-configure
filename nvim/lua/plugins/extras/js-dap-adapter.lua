return {
    "mxsdev/nvim-dap-vscode-js",
    ft = { "svelte", "typescript", "javascript", "vue", "json" },
    dependencies = {
        "mfussenegger/nvim-dap",
        -- build debugger from source
        {
            "microsoft/vscode-js-debug",
            version = "1.x",
            build = "npm i && npm run compile vsDebugServerBundle && rm -rf out && mv dist out",
        },
    },
    config = function()
        require("dap-vscode-js").setup({
            debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
            -- debugger_path = "/Users/yuan/.local/share/nvim/lazy/vscode-js-debug",
            adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
        })

        for _, language in ipairs({ "typescript", "javascript", "svelte", "vue", "json" }) do
            require("dap").configurations[language] = { 
                {
                    type = "pwa-node",
                    request = "launch",
                    name = "debugger-ts",
                    runtimeExecutable = "tsx",
                    sourceMaps = true,
                    -- launch current file
                    program = "${file}",
                    resolveSourceMapLocations = {
                        "${workspaceFolder}/**",
                        "!**/node_modules/**",
                    },
                    skipFiles = { "${workspaceFolder}/node_modules/**/*.js" }, 
                    cwd = "${workspaceFolder}",
                },
                {
                    type = "pwa-msedge",
                    name = "local_8111",
                    request = "launch",
                    url = "http://localhost:8111/v-trace",
                    sourceMaps = true,
                    webRoot = "${workspaceFolder}/src",
                    userDataDir = "/opt/programs/debugger-tools/edge-debugger-cache",
                    runtimeArgs = {
                        "--auto-open-devtools-for-tabs",
                    },
                    -- skip files from vite's hmr
                    skipFiles = { "${workspaceFolder}/node_modules/**/*.js" }, 
                    runtimeExecutable = "/Applications/Google Chrome Canary.app/Contents/MacOS/Google Chrome Canary"
                    --runtimeExecutable = "C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe"
                },
                {
                    -- use nvim-dap-vscode-js's pwa-node debug adapter
                    type = "pwa-node",
                    -- attach to an already running node process with --inspect flag
                    -- default port: 9222
                    request = "attach",
                    -- allows us to pick the process using a picker
                    processId = require("dap.utils").pick_process,
                    -- name of the debug action you have to select for this config
                    name = "Attach debugger node",
                    -- for compiled languages like TypeScript or Svelte.js
                    sourceMaps = true,
                    -- resolve source maps in nested locations while ignoring node_modules
                    resolveSourceMapLocations = {
                        "${workspaceFolder}/**",
                        "!**/node_modules/**",
                    },
                    -- path to src in vite based projects (and most other projects as well)
                    cwd = "${workspaceFolder}/src",
                    -- we don't want to debug code inside node_modules, so skip it!
                    skipFiles = { "${workspaceFolder}/node_modules/**/*.js" },
                },
                -- only if language is javascript, offer this debug action
                language == "javascript"
                        and {
                            type = "pwa-node",
                            request = "launch",
                            name = "node",
                            -- launch current file
                            program = "${file}",
                            cwd = "${workspaceFolder}",
                        }
                    or nil,
            }
        end
    end,
}
