vim.lsp.enable('luals')
vim.lsp.enable('intelephense')
vim.lsp.enable('biome')

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
