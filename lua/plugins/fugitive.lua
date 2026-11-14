return {
    {
        "tpope/vim-fugitive",
        cmd = {"Git", "G", "Gdiffsplit", "Gread", "Gwrite", "Ggrep", "GMove", "GDelete", "GBrowse"},
        keys = {
            {"<leader>gs", "<cmd>Git<CR>", desc = "[G]it [s]tatus"},
        },
    },
}
