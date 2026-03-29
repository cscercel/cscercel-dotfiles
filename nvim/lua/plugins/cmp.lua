return {
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            local cmp_select = { behavior = cmp.SelectBehavior.Select }

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },

                mapping = cmp.mapping.preset.insert({
                    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                    ['<C-Space>'] = cmp.mapping.complete()

                }),

                -- Setup up vim-dadbod
                cmp.setup.filetype({ "sql" }, {
                    sources = {
                        { name = "vim-dadbod-completion" },
                        { name = "buffer" },
                    },
                }),

                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                }, {
                    { name = "buffer" },
                    { name = "path" },
                }),
            })

            -- Upgrade LSP capabilities so cmp works with it
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- Attach capabilities to your servers
            for _, server in ipairs({ "pyright", "lua_ls", "clangd", "gopls", "ts_ls" }) do
                if vim.lsp.config[server] then
                    vim.lsp.config[server].capabilities = capabilities
                end
            end
        end,
    },
}
