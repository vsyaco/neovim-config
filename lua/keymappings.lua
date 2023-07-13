-- Keep VisualMode after indent with > or <
vim.api.nvim_set_keymap('v', '<', '<gv', {noremap = true})
vim.api.nvim_set_keymap('v', '>', '>gv', {noremap = true})

-- " Move Visual blocks with J an K
vim.api.nvim_set_keymap('v', 'J', ":m '>+1<CR>gv=gv", {noremap = true})
vim.api.nvim_set_keymap('v', 'K', ":m '<-2<CR>gv=gv", {noremap = true})

-- Autocomand to remember las editing position
vim.cmd[[au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif]]

-- Use Ctrl-1 to open a list of files
vim.api.nvim_set_keymap('n', '<C-1>', ':Ex<CR>', {noremap = true})

-- Use Ctrl + ] to open the next buffer
vim.api.nvim_set_keymap('n', '<C-]>', ':bnext<CR>', {noremap = true})

-- Use Ctrl + [ to open the previous buffer
vim.api.nvim_set_keymap('n', '<C-[>', ':bprevious<CR>', {noremap = true})

-- Use Ctrl + c to open the buffer list from telescope.lua

-- Close the current buffer
vim.api.nvim_set_keymap('n', '<C-w>', ':bd<CR>', {noremap = true})

-- Find all in files
vim.api.nvim_set_keymap('n', '<C-f>', ':Rg<CR>', {noremap = true})

-- Unmap Esc key to switch between buffers
vim.api.nvim_set_keymap('n', '<Esc>', '', {noremap = true})

-- Ctrl + n is used by vim visual multi

-- Used by airblade/vim-gitgutter:

-- ]c and [c to navigate between git hunks

-- leader + hu undo hunk

-- leader + hs stage hunk

-- BEGIN from telescope.lua:

-- Search for file in project
-- vim.keymap.set('n', '<leader>op', builtin.find_files, {})

-- Search for file in project using git ls-files (for faster search when possible) 
-- vim.keymap.set('n', '<C-p>', builtin.git_files, {})

-- Show help_tags
-- vim.keymap.set('n', 'vh', builtin.help_tags, {})

-- Show symbols in the current document
-- vim.keymap.set('n', '<C-e>', builtin.lsp_document_symbols, {})

-- Show references to the current symbol
-- vim.keymap.set('n', '<C-r>', builtin.lsp_references, {})

-- Go to definition or show a list of definitions
-- vim.keymap.set('n', '<C-d>', builtin.lsp_definitions, {})

-- Show list of buffers
-- vim.keymap.set('n', '<C-c>', builtin.buffers, {})

-- Search for a string
-- vim.keymap.set('n', '<leader>fw', builtin.grep_string, {})

-- Search much faster
-- vim.keymap.set('n', '<leader>ff', builtin.live_grep, {})

-- List in telescope all git files that changed
-- vim.keymap.set('n', '<leader>gs', builtin.git_status, {})

-- END OF telescope.lua

-- Use K to show documentation for the current word

-- Clear search highlights
vim.api.nvim_set_keymap('n', '<leader>nh', ':noh<CR>', {noremap = true})
