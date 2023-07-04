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

-- Close the current buffer
vim.api.nvim_set_keymap('n', '<C-w>', ':bd<CR>', {noremap = true})

-- Find all in files
vim.api.nvim_set_keymap('n', '<C-f>', ':Rg<CR>', {noremap = true})

-- Unmap Esc key to switch between bunffers
vim.api.nvim_set_keymap('n', '<Esc>', '', {noremap = true})

-- Ctrl + n is used by vim visual multi

-- Used by airblade/vim-gitgutter:

-- ]c and [c to navigate between git hunks

-- leader + hu undo hunk

-- leader + hs stage hunk

-- Below is from telescope.lua:

-- List in telescope all files
-- vim.keymap.set('n', '<C-S-p>', builtin.find_files, {})

-- List in telescope all git files
-- vim.keymap.set('n', '<C-p>', builtin.git_files, {})

-- vim.keymap.set('n', 'ps', function()
--	builtin.grep_string({ search = vim.fn.input("Grep > ") })
-- end)

-- Show help tags
-- vim.keymap.set('n', 'vh', builtin.help_tags, {})

-- Show symbols in the current document
-- vim.keymap.set('n', '<C-e>', builtin.lsp_document_symbols, {})

-- Show references to the current symbol
-- vim.keymap.set('n', 'gr', builtin.lsp_references, {})

-- Go to definition or show a list of definitions
-- vim.keymap.set('n', 'gd', builtin.lsp_definitions, {})

-- vim.keymap.set('n', '<C-s>', builtin.grep_string, {})

-- vim.keymap.set('n', '<C-S-s>', builtin.live_grep, {})

-- List in telescope all git files that changed
-- vim.keymap.set('n', '<leader>gs', builtin.git_status, {})
