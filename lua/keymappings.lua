-- Keep VisualMode after indent with > or <
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true })
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true })

-- " Move Visual blocks with J an K
vim.api.nvim_set_keymap('v', 'J', ":m '>+1<CR>gv=gv", { noremap = true })
vim.api.nvim_set_keymap('v', 'K', ":m '<-2<CR>gv=gv", { noremap = true })

-- Autocomand to remember las editing position
vim.cmd [[au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif]]

-- Use Ctrl-1 to open a list of files
-- vim.api.nvim_set_keymap('n', '<C-1>', ':Ex<CR>', {noremap = true})

-- Use Ctrl + ] to open the next buffer
vim.api.nvim_set_keymap('n', '<C-]>', ':bnext<CR>', { noremap = true })

-- Use Ctrl + [ to open the previous buffer
vim.api.nvim_set_keymap('n', '<C-[>', ':bprevious<CR>', { noremap = true })

-- Move between splits
vim.api.nvim_set_keymap("n", "<C-.>", "<C-w>w", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-,>", "<C-w>W", { noremap = true })

-- Move between splits in terminal mode
vim.api.nvim_set_keymap("n", "<C-.>", "<C-w>w", { noremap = true })
vim.api.nvim_set_keymap("t", "<C-,>", "<C-w>W", { noremap = true })

-- Close the current buffer
-- vim.api.nvim_set_keymap('n', '<C-w>', ':bd<CR>', {noremap = true})

-- Find all in files
vim.api.nvim_set_keymap('n', '<C-f>', ':Rg<CR>', { noremap = true })

-- Unmap Esc key to switch between buffers
vim.api.nvim_set_keymap('n', '<Esc>', '', { noremap = true })

-- Ctrl + n is used by vim visual multi

-- Used by airblade/vim-gitgutter:

-- ]c and [c to navigate between git hunks

-- Use K to show documentation for the current word

-- Clear search highlights
vim.api.nvim_set_keymap('n', '<leader>nh', ':noh<CR>', { noremap = true })

-- Format via LSP
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { remap = false })

-- Format via LSP and update buffer file
vim.keymap.set("n", "ff", function()
    vim.lsp.buf.format()
    vim.cmd(":update")
end, { remap = false })

vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { remap = false })

vim.keymap.set("n", "<leader>lc", vim.lsp.buf.code_action, { remap = false })
vim.keymap.set("v", "<leader>lc", vim.lsp.buf.code_action, { remap = false })

vim.keymap.set("n", "zz", "ZZ", { noremap = true })
vim.keymap.set("n", "zq", "ZQ", { noremap = true })

-- Close buffer with leader + w
vim.keymap.set("n", "<leader>w", ":bd<CR>", { noremap = true })

-- Close all buffers except current one
vim.keymap.set("n", "<leader>ow", ":%bd|e#|bd#<CR>", { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>]d', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>]d', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>di', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })

-- " quicker open in vertical split - same like gd for go to definition
vim.keymap.set("n", "gf", "<c-w>vgf", { noremap = true })

-- Move code block up
vim.keymap.set("v", "<C-h>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")

vim.api.nvim_set_keymap('n', '<C-h>', ':m .+1<CR>==', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', ':m .-2<CR>==', { noremap = true, silent = true })
