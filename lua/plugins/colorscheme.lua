return {
    -- Default colorscheme
    {
        "rose-pine/neovim",
        name = "rose-pine",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd("colorscheme rose-pine")
            vim.api.nvim_set_hl(0, "Normal",      { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
            vim.api.nvim_set_hl(0, "SignColumn",  { bg = "none" })
        end,
    },

    -- Colorscheme picker with live preview and persistence
    {
        "zaldih/themery.nvim",
        lazy = false,
        config = function()
            require("themery").setup({
                themes = {
                    "rose-pine-main",
                    "catppuccin",
                    -- add more colorscheme names once installed
                },
                livePreview = true
            })
        end,
    },

    -- OTHER COLORSCHEMES --

    -- Catppuccin
    {
        "catppuccin/nvim",
        name = "catppuccin"
    }
}
