return {
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = {"nvim-lua/plenary.nvim"},
        config = function()
            local harpoon = require("harpoon")

            -- Required: harpoon:setup() must be called - it registers autocmds
            harpoon:setup()

            vim.keymap.set("n", "<leader>a", function()
                harpoon:list():add()
            end, {desc = "Harpoon: add file"})
            vim.keymap.set("n", "<A-e>", function()
                harpoon.ui:toggle_quick_menu(harpoon:list())
            end, {desc = "Harpoon: toggle menu"})
            vim.keymap.set("n", "<A-h>", function()
                harpoon:list():select(1)
            end, {desc = "Harpoon: file 1"})
            vim.keymap.set("n", "<A-t>", function()
                harpoon:list():select(2)
            end, {desc = "Harpoon: file 2"})
            vim.keymap.set("n", "<A-n>", function()
                harpoon:list():select(3)
            end, {desc = "Harpoon: file 3"})
            vim.keymap.set("n", "<A-s>", function()
                harpoon:list():select(4)
            end, {desc = "Harpoon: file 4"})
        end,
    }
}
