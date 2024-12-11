return {
    "pocco81/auto-save.nvim",
    config = function ()
        require("auto-save").setup {
            enabled = true,
            debounce_delay = 3,
            trigger_events = { "TextChanged" }
        }
    end
}
