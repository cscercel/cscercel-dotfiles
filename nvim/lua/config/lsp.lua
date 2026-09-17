-- Disable all diagnostics on startup
vim.diagnostic.config({
    virtual_text = false,
    signs = false,
    underline = false,
    update_in_insert = false,
})

vim.diagnostic.enable(false)

-- Call only when needed
vim.keymap.set("n", "<leader>d", function()
    if vim.diagnostic.is_enabled() then
        vim.diagnostic.enable(false)
        vim.notify("Diagnostics Hidden", vim.log.levels.INFO)
    else
        vim.diagnostic.enable(true)
        vim.notify("Diagnostics Fetched", vim.log.levels.INFO)
    end
end, { desc = "Toggle manual LSP diagnostics" })
