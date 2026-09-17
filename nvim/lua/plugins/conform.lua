return {
    "stevearc/conform.nvim",
    opts = {},
    config = function()
        require("conform").setup({
            format_on_save = {
                timeout_ms = 5000,
            },
            formatters_by_ft = {
                lua = { "stylua" },
                go = { "gofmt" },
                odin = { "odinfmt" },
                python = { "ruff_format" },
                javascript = { "prettier" },
                typescript = { "prettier" },
                json = { "prettier" },
                elixir = { "mix" },
                heex = { "mix" },
            },
        })
    end,
}
