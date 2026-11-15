return {
    {
        "nvim-telescope/telescope.nvim",
        version = "*",
        dependencies = {"nvim-lua/plenary.nvim"},
        cmd = "Telescope",
        keys = {
            {"<leader>ff",  "<cmd>Telescope find_files<CR>", desc = "[F]ind [f]iles"},
            {"<C-p>",       "<cmd>Telescope git_files<CR>", desc = "Git files"},
            {"<leader>ps", function()
                require("telescope.builtin").grep_string({
                    search = vim.fn.input("Grep > "),
                })
            end, desc = "Grep string"},
        },
        config = function()
            local telescope = require("telescope")
            telescope.setup({})
        end,
    },
}


