return {
    -- project management
    {
        "ahmedkhalf/project.nvim",
        event = "VeryLazy",
        keys = {
            {
                "<leader>pp",
                "<cmd>Telescope projects<CR>",
                "Switch to projects",
                mode = { "n", "v" },
            },
        },
        config = function(_, opts)
            require("project_nvim").setup({
                detection_methods = { "pattern" },
                patterns = { ".git", ".svn" },
            })

            local tele_status_ok, telescope = pcall(require, "telescope")

            if not tele_status_ok then
                return
            end

            telescope.load_extension("projects")
            -- telescope.load_extension("package_info")

            --
            -- vim.keymap.set("n", "<leader>pp", "<cmd>Telescope projects<CR>", {
            --     noremap = true,
            --     silent = true,
            --     desc = "Switch to project",
            -- })
            --
            -- vim.keymap.set("n", "<leader>pd", "<cmd>Telescope projects<CR>", {
            --     noremap = true,
            --     silent = true,
            --     desc = "Switch to project",
            -- })
            --
            -- nvim-tree 支持
            vim.g.nvim_tree_respect_buf_cwd = 1
        end,
    },
}
