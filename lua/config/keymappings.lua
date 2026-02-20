-- ========================================
-- Keymappings Configuration
-- ========================================
-- IMPORTANT: The 'desc' parameter is the SINGLE SOURCE OF TRUTH for command descriptions
-- - which-key.nvim automatically discovers commands from 'desc'
-- - keymaps-help.nvim reads from README.md
-- - No need to duplicate descriptions in plugins.lua!
--
-- When adding a new keymap:
-- 1. Add it here with a clear 'desc' parameter
-- 2. Update README.md if it's a major feature
-- 3. That's it! which-key will show it automatically

-- Keep VisualMode after indent with > or <
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true, desc = "Indent left" })
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true, desc = "Indent right" })

-- " Move Visual blocks with J an K
vim.api.nvim_set_keymap('v', 'J', ":m '>+1<CR>gv=gv", { noremap = true, desc = "Move block down" })
vim.api.nvim_set_keymap('v', 'K', ":m '<-2<CR>gv=gv", { noremap = true, desc = "Move block up" })

-- Autocommand to remember last editing position
vim.cmd [[au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif]]

-- Use Ctrl + ] to open the next buffer
vim.api.nvim_set_keymap('n', '<leader>]', ':bnext<CR>', { noremap = true, desc = "Next buffer" })

-- Use Ctrl + [ to open the previous buffer
vim.api.nvim_set_keymap('n', '<leader>[', ':bprevious<CR>', { noremap = true, desc = "Previous buffer" })

-- Splits
vim.api.nvim_set_keymap("n", "<leader>v", ":vsplit<CR>", { noremap = true, desc = "Vertical split" })
vim.api.nvim_set_keymap("n", "<leader>s", ":split<CR>", { noremap = true, desc = "Horizontal split" })

-- Move between splits
vim.api.nvim_set_keymap("n", "<C-.>", "<C-w>w", { noremap = true, desc = "Next split" })
vim.api.nvim_set_keymap("n", "<C-,>", "<C-w>W", { noremap = true, desc = "Previous split" })
vim.api.nvim_set_keymap("t", "<C-.>", "<C-w>w", { noremap = true, desc = "Next split" })
vim.api.nvim_set_keymap("t", "<C-,>", "<C-w>W", { noremap = true, desc = "Previous split" })

-- Unmap Esc key to switch between buffers
vim.api.nvim_set_keymap('n', '<Esc>', '', { noremap = true })

-- Ctrl + n is used by vim visual multi

-- Used by airblade/vim-gitgutter:

-- ]c and [c to navigate between git hunks

-- Clear search highlights
vim.api.nvim_set_keymap('n', '<leader>nh', ':noh<CR>', { noremap = true, desc = "Clear highlights" })

local format = require("config.format")

vim.keymap.set("n", "<leader>lf", format.format_lsp, { remap = false, desc = "Format code (LSP)" })

-- Format via LSP and update buffer file
vim.keymap.set("n", "<leader>e", format.format_and_update, { remap = false, desc = "Format & save" })


-- Close qfixlist
vim.keymap.set("n", "zx", "<cmd>cclose<CR>", { noremap = true, desc = "Close quickfix" })

-- Close buffer with leader + w
vim.keymap.set("n", "<leader>w", ":bd<CR>", { noremap = true, desc = "Close buffer" })

-- Close all buffers except current one
vim.keymap.set("n", "<leader>ow", ":%bd|e#|bd#<CR>", { noremap = true, desc = "Close other buffers" })

vim.api.nvim_set_keymap('n', '<leader>]d', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true, desc = "Next diagnostic" })
vim.api.nvim_set_keymap('n', '<leader>di', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true, desc = "Show diagnostic" })

-- " quicker open in vertical split - same like gd for go to definition
vim.keymap.set("n", "gf", "<c-w>vgf", { noremap = true, desc = "Open file in vsplit" })

-- Move code block up/down
vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv", { desc = "Move block up" })
vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv", { desc = "Move block down" })

vim.api.nvim_set_keymap('n', '<M-j>', ':m .+1<CR>==', { noremap = true, silent = true, desc = "Move line down" })
vim.api.nvim_set_keymap('n', '<M-k>', ':m .-2<CR>==', { noremap = true, silent = true, desc = "Move line up" })


--- Navigate between quickfix items
vim.api.nvim_set_keymap('n', '<C-]>', '<cmd>cnext<CR>zz', { desc = "Forward qfixlist", noremap = true })
vim.api.nvim_set_keymap('n', '<C-[>', '<cmd>cprev<CR>zz', { desc = "Backward qfixlist", noremap = true })

--- Navigate between locations list items
vim.api.nvim_set_keymap('n', '<leader>q', '<cmd>lnext<CR>zz', { desc = "Forward location list", noremap = true })
vim.api.nvim_set_keymap('n', '<leader>a', '<cmd>lprev<CR>zz', { desc = "Backward location list", noremap = true })

--- Floatterminal
vim.keymap.set("n", "<C-`>", "<cmd>:Floaterminal<CR>", { desc = "Toggle terminal" })

-- Neo-tree
vim.api.nvim_set_keymap('n', '<C-b>', ':Neotree toggle<CR>', { desc = "Toggle file tree", noremap = true })

-- Neo-tree Git status (changed files) on the right sidebar
vim.keymap.set("n", "<C-g>", "<cmd>Neotree toggle source=git_status position=right<CR>",
    { desc = "Git status sidebar", noremap = true, silent = true })

-- Default Neovim LSP bindings:
-- K is mapped to vim.lsp.buf.hover() unless 'keywordprg' is customized or a custom keymap for K exists.
-- GLOBAL DEFAULTS
-- grr gra grn gri i_CTRL-S These GLOBAL keymaps are created unconditionally when Nvim starts:
-- "grn" is mapped in Normal mode to vim.lsp.buf.rename()
-- "gra" is mapped in Normal and Visual mode to vim.lsp.buf.code_action()
-- "grr" is mapped in Normal mode to vim.lsp.buf.references()
-- "gri" is mapped in Normal mode to vim.lsp.buf.implementation()
-- "gO" is mapped in Normal mode to vim.lsp.buf.document_symbol()
-- CTRL-S is mapped in Insert mode to vim.lsp.buf.signature_help()

vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true, desc = "Go to definition" })

-- Git workflow (simplified - removed custom plugin)
-- Using standard plugins: telescope, diffview, fugitive
local telescope_builtin_ok, telescope_builtin = pcall(require, 'telescope.builtin')

if telescope_builtin_ok then
    -- Git log with telescope
    vim.keymap.set("n", "<leader>gl", telescope_builtin.git_commits, { desc = "Git log (all commits)" })
    vim.keymap.set("n", "<leader>gL", telescope_builtin.git_bcommits, { desc = "Git log (current file)" })
    vim.keymap.set("n", "<leader>gb", telescope_builtin.git_branches, { desc = "Git branches" })
    vim.keymap.set("n", "<leader>gs", telescope_builtin.git_status, { desc = "Git status" })
end

-- Diffview keymaps
vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<CR>", { desc = "Diffview: unstaged changes" })
vim.keymap.set("n", "<leader>gD", "<cmd>DiffviewOpen --staged<CR>", { desc = "Diffview: staged changes" })
vim.keymap.set("n", "<leader>gh", "<cmd>DiffviewFileHistory %<CR>", { desc = "Diffview: file history" })
vim.keymap.set("n", "<leader>gH", "<cmd>DiffviewFileHistory<CR>", { desc = "Diffview: repo history" })
vim.keymap.set("n", "<leader>gx", "<cmd>DiffviewClose<CR>", { desc = "Close diffview" })

-- Fugitive keymaps
vim.keymap.set("n", "<leader>gB", "<cmd>Git checkout -b ", { desc = "Create new branch" })
vim.keymap.set("n", "<leader>gp", "<cmd>Git push<CR>", { desc = "Git push" })
vim.keymap.set("n", "<leader>gP", "<cmd>Git pull<CR>", { desc = "Git pull" })
