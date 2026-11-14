return {
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",         -- LSP source (bridges clangd/lua_ls to cmp)
            "hrsh7th/cmp-buffer",           -- words already present in the buffer
            "hrsh7th/cmp-path",             -- filesystem paths
            "L3MON4D3/LuaSnip",            -- snippet engine
            "saadparwaiz1/cmp_luasnip",     --LuaSnip source for cmp
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<Tab>"]   = cmp.mapping.select_next_item(),
                    ["<S-Tab>"]   = cmp.mapping.select_prev_item(),
                    ["<C-Space>"]= cmp.mapping.complete(),
                    ["<C-e>"]   = cmp.mapping.abort(),
                    ["<CR>"]    = cmp.mapping.confirm({select=true}),
                }),
                windows = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                sources = cmp.config.sources(
                    {
                        {name="nvim_lsp"},
                        {name="luasnip"},
                        {name="path"},
                    },
                    {
                        {name="buffer"},
                    }
                ),
            })
        end,
    },
}


