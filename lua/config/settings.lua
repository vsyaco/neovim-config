vim.g.mapleader = " "

vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"

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
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamed,unnamedplus'
vim.opt.showmatch = true
vim.opt.termguicolors = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = '¦ ' }
vim.opt.syntax = 'on'
vim.opt.updatetime = 250
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.background = 'dark'

-- Prepend mason bin to PATH
vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. vim.env.PATH

vim.env.FZF_DEFAULT_COMMAND = 'find . \\( -name vendor -o -name node_modules -o -name .git \\) -prune -o -print'

-- Set colorscheme
local ok, _ = pcall(vim.cmd, 'colorscheme rose-pine-moon')
if not ok then
    vim.cmd 'colorscheme habamax' -- fallback to builtin
end

-- Set cursorline
vim.cmd [[ au VimEnter,WinEnter,BufWinEnter * setlocal cursorline ]]
