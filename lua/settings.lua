-- Disable netrw to use nvim-tree instead
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = " "

vim.opt.relativenumber = true


vim.api.nvim_set_keymap('', ',', '', {})
vim.opt.compatible = false
vim.opt.number = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.errorbells = false
vim.opt.belloff = 'all'
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamed,unnamedplus'
vim.opt.showmatch = true
vim.opt.termguicolors = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = '¦ ' }
vim.opt.syntax = 'on'
vim.opt.updatetime = 50
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.background = 'dark'

vim.env.FZF_DEFAULT_COMMAND = 'find . \\( -name vendor -o -name node_modules -o -name .git \\) -prune -o -print'

vim.g["airline#extensions#tabline#enabled"] = 0

-- Set cursorline
vim.cmd [[ au VimEnter,WinEnter,BufWinEnter * setlocal cursorline ]]

