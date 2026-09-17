return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-buffer",
    },
    config = function()
        local cmp = require("cmp")

        cmp.setup({
            completion = {
                autocomplete = false,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                ["<C-n>"] = cmp.mapping.select_next_item(),
                ["<C-p>"] = cmp.mapping.select_prev_item(),
            }),
            sources = cmp.config.sources({
                { name = "buffer" },
            }),
        })
    end,
}
