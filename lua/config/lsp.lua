vim.lsp.enable('luals')
vim.lsp.enable('intelephense')
vim.lsp.enable('biome')
vim.lsp.enable('gopls')

-- Diagnostic configuration
vim.diagnostic.config({
    virtual_text = {
        prefix = '●', -- Could be '■', '▎', 'x'
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '✘',
            [vim.diagnostic.severity.WARN] = '▲',
            [vim.diagnostic.severity.HINT] = '⚑',
            [vim.diagnostic.severity.INFO] = '»',
        },
    },
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})

-- Merge capabilities from lsp-file-operations
local file_operations_caps = {}
pcall(function()
    file_operations_caps = require("lsp-file-operations").default_capabilities()
end)

vim.lsp.config('*', {
    capabilities = vim.tbl_deep_extend("force", {
        textDocument = {
            semanticTokens = {
                multilineTokenSupport = true,
            }
        }
    }, file_operations_caps),
    root_markers = { '.git' },
})
