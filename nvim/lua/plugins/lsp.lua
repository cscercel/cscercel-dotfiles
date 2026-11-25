return {
    {
        "williamboman/mason.nvim",
        config = true, -- shorthand for require("mason").setup()
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "pyright",
                    "lua_ls",
                    "gopls",
                    "ts_ls",
                    "ols",
                    "elixirls",
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local opts = { buffer = args.buf, silent = true }
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                    vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts)
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

                    -- gopls: disable semantic token highlighting
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    if client and client.name == "gopls" then
                        client.server_capabilities.semanticTokensProvider = nil
                    end
                end,
            })

            vim.lsp.config["pyright"] = {
                settings = {
                    python = {
                        pythonPath = vim.fn.getcwd() .. "/.venv/bin/python",
                    },
                },
            }

            vim.lsp.config["lua_ls"] = {
                settings = {
                    Lua = {
                        workspace = { checkThirdParty = false },
                    },
                },
            }

            vim.lsp.config["elixirls"] = {
                settings = {
                    elixirLS = {
                        dialyzerEnabled = false,
                        fetchDeps = false,
                    },
                },
            }

            -- start servers automatically when opening matching filetypes
            vim.lsp.enable("pyright")
            vim.lsp.enable("lua_ls")
            vim.lsp.enable("gopls")
            vim.lsp.enable("ts_ls")
            vim.lsp.enable("ols")
            vim.lsp.enable("elixirls")

            -- no diagnostics
            vim.diagnostic.enable(false)
        end,
    },
}
