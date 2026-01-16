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

vim.lsp.config('*', {
    capabilities = {
        textDocument = {
            semanticTokens = {
                multilineTokenSupport = true,
            }
        }
    },
    root_markers = { '.git' },
})
