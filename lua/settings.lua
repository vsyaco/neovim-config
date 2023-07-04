vim.api.nvim_set_keymap('', ',', '', {})
vim.opt.compatible = false
vim.opt.number = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.errorbells = false
vim.opt.belloff = 'esc'
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
vim.opt.listchars = {tab = '¦ '}
vim.opt.syntax = 'on'

vim.cmd[[colorscheme palenight]]
vim.opt.background = 'dark'

vim.env.FZF_DEFAULT_COMMAND = 'find . \\( -name vendor -o -name node_modules -o -name .git \\) -prune -o -print'

vim.g["airline#extensions#tabline#enabled"] = 1

-- Disable sounds
vim.cmd[[au GUIEnter * silent! !osascript -e 'set volume output muted true']]
