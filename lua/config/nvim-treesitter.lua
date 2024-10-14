require("nvim-treesitter.configs").setup({
    -- To install additional languages, do: `:TSInstall <mylang>`. `:TSInstall maintained` to install all maintained
    ensure_installed = "php",
    sync_installed = true,
    highlight = {
        enable = true, -- This is a MUST
        additional_vim_regex_highlighting = { "php", "html", "css", "javascript", "typescript", "vue", "lua", "go" },
    },
    indent = {
        enable = false, -- Really breaks stuff if true
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },
})


vim.api.nvim_create_autocmd({ 'BufEnter', 'BufNewFile' }, {
    pattern = '*.blade.php',
    command = 'set filetype=html',
})

-- Enable folds (zc and zo) on functions and classes but not by default
vim.cmd([[
    set nofoldenable
    set foldmethod=expr
    set foldexpr=nvim_treesitter#foldexpr()
]])
