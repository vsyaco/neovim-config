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


