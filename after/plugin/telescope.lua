local builtin = require('telescope.builtin')

-- Search for file in project
vim.keymap.set('n', '<C-f>', builtin.find_files, { desc = "Find files" })

-- Search for file in project using git ls-files (for faster search when possible)
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = "Find git files" })

-- Show help_tags
vim.keymap.set('n', '<leader>ht', builtin.help_tags, { desc = "Help tags" })

-- Show symbols in the current document
vim.keymap.set('n', '<leader>ls', builtin.lsp_document_symbols, { desc = "Document symbols" })

-- Show symbols in the current project
vim.keymap.set('n', '<leader>lp', builtin.lsp_dynamic_workspace_symbols, { desc = "Workspace symbols" })

-- Show references to the current symbol
vim.keymap.set('n', '<leader>gr', builtin.lsp_references, { desc = "LSP references" })

-- Show list of buffers
vim.keymap.set('n', '<C-c>', builtin.buffers, { desc = "Buffers" })

-- Search in file contents (live grep)
vim.keymap.set('n', '<leader>f', builtin.live_grep, { desc = "Live grep" })

-- List in telescope all git files that changed
vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = "Git status" })

-- List diagnostics to current buffer
vim.keymap.set('n', '<leader>ld', builtin.diagnostics, { desc = "Diagnostics" })

require('telescope').setup({
    defaults = {
    },
    pickers = {
        find_files = {
            hidden = true,
            no_ignore = true,
        },
        git_files = {
            hidden = true,
            no_ignore = true,
            previewer = false,
        },
        lsp_references = {
            previewer = false,
        },
        buffers = {
            previewer = false,
        },
    },
})
