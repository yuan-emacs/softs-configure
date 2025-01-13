return {
    "midoBB/nvim-quicktype",
    cmd = "QuickType",
    ft = { "typescript", "python", "java", "go", "rust", "cs", "swift", "elixir", "kotlin", "typescriptreact" },
    keys = {
        {
            "<leader>tt",
            function()
                require("nvim-quicktype").generate_type()
            end,
            "JSON to typescript",
            mode = { "n", "v" },
        },
        {
            "<leader>tq",
            "<cmd>QuickType<CR>",
            "JSON to typescript",
            mode = { "n", "v" },
        },
    },
}
