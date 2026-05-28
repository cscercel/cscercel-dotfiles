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
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local on_attach = function(_, bufnr)
        local opts = { buffer = bufnr, silent = true }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      end

      vim.lsp.config["pyright"] = {
        on_attach = on_attach,
        settings = {
            python = {
                pythonPath = vim.fn.getcwd() .. "/.venv/bin/python",
            },
        },
      }

      vim.lsp.config["lua_ls"] = {
        on_attach = on_attach,
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
          },
        },
      }

      vim.lsp.config["gopls"] = {
        on_attach = on_attach,
      }

      vim.lsp.config["ts_ls"] = {
        on_attach = on_attach,
      }

      -- start servers automatically when opening matching filetypes
      vim.lsp.enable("pyright")
      vim.lsp.enable("lua_ls")
      vim.lsp.enable("gopls")
      vim.lsp.enable("ts_ls")

      -- Inline diagnostics
      vim.diagnostic.config({
                signs = true,
                update_in_insert = false,
                underline = true,
                severity_sort = true,
                float = {
                    border = "rounded",
                    style = "minimal",
                    source = "always",
                    header = "",
                    prefix = "",
                },
        })

        -- Show diagnostics in a floating window on cursor hold
        vim.api.nvim_create_autocmd("CursorHold", {
            group = vim.api.nvim_create_augroup("ShowLineDiagnostics", { clear = true }),
            callback = function()
                vim.diagnostic.open_float(nil, { focus = false, scope = "line" })
            end,
        })

    end,
  },
}
