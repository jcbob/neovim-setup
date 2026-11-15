return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        dependencies = {
            {"nvim-mini/mini.icons", opts = {style = "ascii"}},
        },
        opts = {
            preset = "modern",      -- "classic" || "modern" || "helix"
        },
        keys = {
            {"<leader>?", function()
                require("which-key").show({global=false})
            end, desc = "Buffer-local keymaps (which-key)"}
        },
    },
}

