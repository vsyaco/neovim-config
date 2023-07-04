local builtin = require('telescope.builtin')

vim.keymap.set('n', '<C-S-p>', builtin.find_files, {})

vim.keymap.set('n', '<C-p>', builtin.git_files, {})

-- vim.keymap.set('n', 'ps', function()
--	builtin.grep_string({ search = vim.fn.input("Grep > ") })
-- end)

-- vim.keymap.set('n', 'vh', builtin.help_tags, {})

vim.keymap.set('n', '<C-e>', builtin.lsp_document_symbols, {})

vim.keymap.set('n', 'gr', builtin.lsp_references, {})

vim.keymap.set('n', 'gd', builtin.lsp_definitions, {})

vim.keymap.set('n', '<C-s>', builtin.grep_string, {})

vim.keymap.set('n', '<C-S-s>', builtin.live_grep, {})

vim.keymap.set('n', '<leader>gs', builtin.git_status, {})
