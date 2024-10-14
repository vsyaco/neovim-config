local builtin = require('telescope.builtin')

-- Search for file in project
vim.keymap.set('n', '<leader>p', builtin.find_files, {})

-- Search for file in project using git ls-files (for faster search when possible)
-- Vertical split
vim.keymap.set('n', '<C-p>', builtin.git_files, {})

-- Show help_tags
vim.keymap.set('n', 'vh', builtin.help_tags, {})

-- Show symbols in the current document
vim.keymap.set('n', '<leader>ls', builtin.lsp_document_symbols, {})

-- Show references to the current symbol
vim.keymap.set('n', '<leader>gr', builtin.lsp_references, {})

-- Go to definition or show a list of definitions
vim.keymap.set('n', '<leader>gd', builtin.lsp_definitions, {})

-- Show list of buffers
vim.keymap.set('n', '<C-c>', builtin.buffers, {})

-- Search for a string
vim.keymap.set('n', '<leader>fw', builtin.grep_string, {})

-- Search much faster
vim.keymap.set('n', '<leader>f', builtin.live_grep, {})

-- List in telescope all git files that changed
vim.keymap.set('n', '<leader>gs', builtin.git_status, {})

-- List diagnostics to current buffer
vim.keymap.set('n', '<leader>ld', builtin.diagnostics, {})

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
