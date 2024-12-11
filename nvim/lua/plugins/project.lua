return {
    -- project management
    {
        "ahmedkhalf/project.nvim",
        event = "VeryLazy",
        config = function(_, opts)
            require("project_nvim").setup({
                detection_methods = { "pattern" },
                patterns = { ".git", ".svn" }
            })

            local tele_status_ok, telescope = pcall(require, "telescope")
            if not tele_status_ok then
                return
            end

            telescope.load_extension("projects")

            vim.keymap.set("n", "<leader>fp", "<cmd>Telescope projects<CR>", {
                noremap = true,
                silent = true,
                desc = "Switch to project",
            })

            -- nvim-tree 支持
            vim.g.nvim_tree_respect_buf_cwd = 1

        end,
    }
}
