return {
    "midoBB/nvim-quicktype",
    cmd = "QuickType",
    ft = {
        typescript = {
            lang = "typescript", -- The language to generate types for
            additional_options = {
                -- Add any additional options here
                -- Example:
                -- ["just-types"] = true,
                ["prefer-unions"] = true,
                ["just-types"] = false,
            },
        },
        "python",
        "java",
        "go",
        "rust",
        "cs",
        "swift",
        "elixir",
        "kotlin",
        "typescriptreact",
    },
    keys = {
        {
            "<leader>tt",
            function()
                require("nvim-quicktype").generate_type()
            end,
            desc = "JSON to typescript",
            mode = { "n", "v" },
        },
        -- {
        --     "<leader>qt",
        --     "<cmd>QuickType<CR>",
        --     desc = "JSON to typescript",
        --     mode = { "n", "v" },
        -- },
    },
}
